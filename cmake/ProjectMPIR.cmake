ExternalProject_Add(mpir
    PREFIX ${CMAKE_SOURCE_DIR}/deps
    DOWNLOAD_NAME mpir-master.tar.gz
    DOWNLOAD_NO_PROGRESS TRUE
    URL https://github.com/chfast/mpir/archive/master.tar.gz
    URL_HASH SHA256=ed52442ab345c9dbb463d9c4bee4436785dd6a3ab6d24e461302dd3f93bedbb4
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
        -DCMAKE_BUILD_TYPE=Release
)

ExternalProject_Get_Property(mpir INSTALL_DIR)
add_library(MPIR::mpz STATIC IMPORTED)
set(MPIR_LIBRARY ${INSTALL_DIR}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}mpz${CMAKE_STATIC_LIBRARY_SUFFIX})
set(MPIR_INCLUDE_DIR ${INSTALL_DIR}/include)
set_property(TARGET MPIR::mpz PROPERTY IMPORTED_LOCATION ${MPIR_LIBRARY})
set_property(TARGET MPIR::mpz PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${MPIR_INCLUDE_DIR})
add_dependencies(MPIR::mpz mpir)
unset(INSTALL_DIR)