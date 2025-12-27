cmake_minimum_required(VERSION 3.22.1)

project(flutter_open_chinese_convert)

# Define source files for OpenCC static library
set(OPENCC_SOURCES
    OpenCC/src/BinaryDict.cpp
    OpenCC/src/Config.cpp
    OpenCC/src/Conversion.cpp
    OpenCC/src/ConversionChain.cpp
    OpenCC/src/Converter.cpp
    OpenCC/src/DartsDict.cpp
    OpenCC/src/Dict.cpp
    OpenCC/src/DictEntry.cpp
    OpenCC/src/DictGroup.cpp
    OpenCC/src/Lexicon.cpp
    OpenCC/src/MarisaDict.cpp
    OpenCC/src/MaxMatchSegmentation.cpp
    OpenCC/src/PhraseExtract.cpp
    OpenCC/src/SerializedValues.cpp
    OpenCC/src/Segmentation.cpp
    OpenCC/src/SimpleConverter.cpp
    OpenCC/src/TextDict.cpp
    OpenCC/src/UTF8StringSlice.cpp
    OpenCC/src/UTF8Util.cpp
    OpenCC/deps/marisa-0.2.6/lib/marisa/trie.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/agent.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/io/reader.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/io/writer.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/io/mapper.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/trie/louds-trie.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/trie/tail.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/grimoire/vector/bit-vector.cc
    OpenCC/deps/marisa-0.2.6/lib/marisa/keyset.cc
)

# Add OpenCC static library
add_library(OpenCC STATIC ${OPENCC_SOURCES})

# Include directories for OpenCC
target_include_directories(OpenCC PRIVATE
    OpenCC/deps/darts-clone/
    OpenCC/deps/marisa-0.2.6/include/
    OpenCC/deps/marisa-0.2.6/lib/
    OpenCC/deps/rapidjson-1.1.0/
)

# Compile definition
target_compile_definitions(OpenCC PRIVATE OPENCC_ENABLE_DARTS)

# Add ChineseConverter shared library
add_library(ChineseConverter SHARED
    chineseconverter.cpp
)

# Include directories for ChineseConverter (needs OpenCC headers)
target_include_directories(ChineseConverter PRIVATE
    OpenCC/src/
)

# Link libraries
target_link_libraries(ChineseConverter
    OpenCC
    log
    android
)

# Set 16KB page size linker flag
target_link_options(ChineseConverter PRIVATE "-Wl,-z,max-page-size=16384")
