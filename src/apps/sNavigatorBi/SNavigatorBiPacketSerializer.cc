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

#include "apps/sNavigatorBi/SNavigatorBiPacketSerializer.h"
#include "inet/common/packet/serializer/ChunkSerializerRegistry.h"
#include "SNavigatorBiPacket_m.h"

using namespace inet;

Register_Serializer(SNavigatorBiPacket, SNavigatorBiPacketSerializer);

void SNavigatorBiPacketSerializer::serialize(MemoryOutputStream& stream, const Ptr<const Chunk>& chunk) const
{
    auto startPosition = stream.getLength();
    const auto& sNavigatorBiPacket = staticPtrCast<const SNavigatorBiPacket>(chunk);
    stream.writeUint32Be(B(sNavigatorBiPacket->getChunkLength()).get());
    stream.writeUint32Be(sNavigatorBiPacket->getIDtalk());
    stream.writeUint32Be(sNavigatorBiPacket->getType());
    stream.writeUint32Be(std::stoul(sNavigatorBiPacket->getNavMessage()));

    int64_t remainders = B(sNavigatorBiPacket->getChunkLength() - (stream.getLength() - startPosition)).get();
    if (remainders < 0)
        throw cRuntimeError("sNavigatorBiPacket length = %d smaller than required %d bytes", (int)B(sNavigatorBiPacket->getChunkLength()).get(), (int)B(stream.getLength() - startPosition).get());
    stream.writeByteRepeatedly('?', remainders);
}

const Ptr<Chunk> SNavigatorBiPacketSerializer::deserialize(MemoryInputStream& stream) const
{
    auto startPosition = stream.getPosition();
    auto sNavigatorBiPacket = makeShared<SNavigatorBiPacket>();
    B dataLength = B(stream.readUint32Be());
    sNavigatorBiPacket->setIDtalk(stream.readUint32Be());
    sNavigatorBiPacket->setType(stream.readUint32Be());
    sNavigatorBiPacket->setNavMessage(std::to_string(stream.readUint32Be()).c_str());

    B remainders = dataLength - (stream.getPosition() - startPosition);
    ASSERT(remainders >= B(0));
    stream.readByteRepeatedly('?', B(remainders).get());
    return sNavigatorBiPacket;
}


