//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

#include "apps/sNavigator/SNavigatorPacketSerializer.h"
#include "inet/common/packet/serializer/ChunkSerializerRegistry.h"
#include "SNavigatorPacket_m.h"

using namespace inet;

Register_Serializer(SNavigatorPacket, SNavigatorPacketSerializer);

void SNavigatorPacketSerializer::serialize(MemoryOutputStream& stream, const Ptr<const Chunk>& chunk) const
{
    auto startPosition = stream.getLength();
    const auto& sNavigatorPacket = staticPtrCast<const SNavigatorPacket>(chunk);
    stream.writeUint32Be(B(sNavigatorPacket->getChunkLength()).get());
    stream.writeUint32Be(sNavigatorPacket->getIDtalk());
    stream.writeUint32Be(sNavigatorPacket->getNframes());
    stream.writeUint32Be(sNavigatorPacket->getIDframe());
    stream.writeUint64Be(sNavigatorPacket->getPayloadTimestamp().raw());
    stream.writeUint64Be(sNavigatorPacket->getArrivalTime().raw());
    stream.writeUint64Be(sNavigatorPacket->getPlayoutTime().raw());
    stream.writeUint32Be(sNavigatorPacket->getPayloadSize());

    int64_t remainders = B(sNavigatorPacket->getChunkLength() - (stream.getLength() - startPosition)).get();
    if (remainders < 0)
        throw cRuntimeError("sNavigatorPacket length = %d smaller than required %d bytes", (int)B(sNavigatorPacket->getChunkLength()).get(), (int)B(stream.getLength() - startPosition).get());
    stream.writeByteRepeatedly('?', remainders);
}

const Ptr<Chunk> SNavigatorPacketSerializer::deserialize(MemoryInputStream& stream) const
{
    auto startPosition = stream.getPosition();
    auto sNavigatorPacket = makeShared<SNavigatorPacket>();
    B dataLength = B(stream.readUint32Be());
    sNavigatorPacket->setIDtalk(stream.readUint32Be());
    sNavigatorPacket->setNframes(stream.readUint32Be());
    sNavigatorPacket->setIDframe(stream.readUint32Be());
    sNavigatorPacket->getPayloadTimestamp().setRaw(stream.readUint64Be());
    sNavigatorPacket->getArrivalTime().setRaw(stream.readUint64Be());
    sNavigatorPacket->getPlayoutTime().setRaw(stream.readUint64Be());
    sNavigatorPacket->setPayloadSize(stream.readUint32Be());

    B remainders = dataLength - (stream.getPosition() - startPosition);
    ASSERT(remainders >= B(0));
    stream.readByteRepeatedly('?', B(remainders).get());
    return sNavigatorPacket;
}

