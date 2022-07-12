EAPI=7

MY_PN="${PN/-bin/}"

inherit eutils desktop xdg-utils

DESCRIPTION="Multi-platform 2D and 3D game engine"
HOMEPAGE="https://godotengine.org"
SRC_URI="https://github.com/godotengine/godot/releases/download/${PV}-stable/godot-${PV}-stable.tar.xz"
RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="opt/${MY_PN}/*"

S="${WORKDIR}"

src_install() {
    # Install in /opt
    dodir /opt
    cp -pPR "${S}" "${D}/opt/${MY_PN}"
    fperms 0755 /opt/${MY_PN}

    dosym "../../opt/${MY_PN}/bin/godot" "/usr/bin/${MY_PN}"
    dosym "../../opt/${MY_PN}/bin/godot" "/usr/bin/godot"
}
