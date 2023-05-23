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

#include "apps/sNavigator2/SNavigatorPacketSerializer2.h"
#include "inet/common/packet/serializer/ChunkSerializerRegistry.h"
#include "SNavigatorPacket2_m.h"

using namespace inet;

Register_Serializer(SNavigatorPacket2, SNavigatorPacketSerializer2);

void SNavigatorPacketSerializer2::serialize(MemoryOutputStream& stream, const Ptr<const Chunk>& chunk) const
{
    auto startPosition = stream.getLength();
    const auto& sNavigatorPacket2 = staticPtrCast<const SNavigatorPacket2>(chunk);
    stream.writeUint32Be(B(sNavigatorPacket2->getChunkLength()).get());
    stream.writeUint32Be(sNavigatorPacket2->getIDtalk());
    stream.writeUint32Be(std::stoul(sNavigatorPacket2->getNavMessage()));
    stream.writeUint32Be(std::stoul(sNavigatorPacket2->getNavPosition()));

    int64_t remainders = B(sNavigatorPacket2->getChunkLength() - (stream.getLength() - startPosition)).get();
    if (remainders < 0)
        throw cRuntimeError("sNavigatorPacket2 length = %d smaller than required %d bytes", (int)B(sNavigatorPacket2->getChunkLength()).get(), (int)B(stream.getLength() - startPosition).get());
    stream.writeByteRepeatedly('?', remainders);
}

const Ptr<Chunk> SNavigatorPacketSerializer2::deserialize(MemoryInputStream& stream) const
{
    auto startPosition = stream.getPosition();
    auto sNavigatorPacket2 = makeShared<SNavigatorPacket2>();
    B dataLength = B(stream.readUint32Be());
    sNavigatorPacket2->setIDtalk(stream.readUint32Be());
    sNavigatorPacket2->setNavMessage(std::to_string(stream.readUint32Be()).c_str());
    sNavigatorPacket2->setNavPosition(std::to_string(stream.readUint32Be()).c_str());

    B remainders = dataLength - (stream.getPosition() - startPosition);
    ASSERT(remainders >= B(0));
    stream.readByteRepeatedly('?', B(remainders).get());
    return sNavigatorPacket2;
}


