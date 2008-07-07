From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kbuild tree build failure
Date: Mon, 7 Jul 2008 18:40:38 +1000
Message-ID: <20080707184038.aaeb8d40.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Jul_2008_18_40_38_+1000_O4.54/cNxjJYk_g5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52246 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752653AbYGGIkx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 04:40:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-next@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

--Signature=_Mon__7_Jul_2008_18_40_38_+1000_O4.54/cNxjJYk_g5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/platforms/cell/spu_base.c: In function '__spu_trap_data_seg':
arch/powerpc/platforms/cell/spu_base.c:194: error: duplicate case value
arch/powerpc/platforms/cell/spu_base.c:177: error: previously used here

This means that USER_REGION_ID (line 177) is the same as KERNEL_REGION_ID
(line 194).

>From include/asm-powerpc/pgtable-ppc64.h:

#define REGION_SHIFT            60UL
#define REGION_MASK             (0xfUL << REGION_SHIFT)
#define REGION_ID(ea)           (((unsigned long)(ea)) >> REGION_SHIFT)

#define VMALLOC_REGION_ID       (REGION_ID(VMALLOC_START))
#define KERNEL_REGION_ID        (REGION_ID(PAGE_OFFSET))
#define VMEMMAP_REGION_ID       (0xfUL)
#define USER_REGION_ID          (0UL)

>From include/asm-powerpc/page.h:

#define PAGE_OFFSET     ASM_CONST(CONFIG_PAGE_OFFSET)

>From .config:

CONFIG_PAGE_OFFSET=3D0xffffffff

Not good.

>From arch/powerpc/Kconfig (ADVANCED_OPTIONS is not set):

config PAGE_OFFSET_BOOL
        bool "Set custom page offset address"
        depends on ADVANCED_OPTIONS

config PAGE_OFFSET
        hex "Virtual address of memory base" if PAGE_OFFSET_BOOL
        default "0xc0000000"

if PPC64
config PAGE_OFFSET
        hex
        default "0xc000000000000000"
endif

Reverting commit 9ba4ff5059e1a26698786373c8c71321c37ef7f9 ("kconfig:
normalize int/hex values") seems to have fixed it.

>From .config:

CONFIG_PAGE_OFFSET=3D0xc000000000000000

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Jul_2008_18_40_38_+1000_O4.54/cNxjJYk_g5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhx1ocACgkQjjKRsyhoI8ysuQCeK23Z5k0PdIVbykT+ah1fVEJk
KusAoL9IYklG+H+0LgRSAT2Yx+B90ePB
=iNYV
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jul_2008_18_40_38_+1000_O4.54/cNxjJYk_g5--
