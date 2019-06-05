From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tpmdd tree
Date: Wed, 5 Jun 2019 12:09:46 +1000
Message-ID: <20190605120946.43b44032@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Gb31PL/gttZQcWVCL4d94hY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@google.com>, Bartosz Szczepanek <bsz@semihalf.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Gb31PL/gttZQcWVCL4d94hY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tpmdd tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

include/linux/tpm_eventlog.h: In function '__calc_tpm2_event_size':
drivers/firmware/efi/tpm.c:7:35: error: implicit declaration of function 'e=
arly_memremap'; did you mean 'early_memtest'? [-Werror=3Dimplicit-function-=
declaration]
 #define TPM_MEMREMAP(start, size) early_memremap(start, size)
                                   ^~~~~~~~~~~~~~
include/linux/tpm_eventlog.h:182:13: note: in expansion of macro 'TPM_MEMRE=
MAP'
   mapping =3D TPM_MEMREMAP((unsigned long)marker_start,
             ^~~~~~~~~~~~
In file included from drivers/firmware/efi/tpm.c:13:
include/linux/tpm_eventlog.h:182:11: warning: assignment to 'void *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
   mapping =3D TPM_MEMREMAP((unsigned long)marker_start,
           ^
drivers/firmware/efi/tpm.c:8:35: error: implicit declaration of function 'e=
arly_memunmap'; did you mean 'early_memtest'? [-Werror=3Dimplicit-function-=
declaration]
 #define TPM_MEMUNMAP(start, size) early_memunmap(start, size)
                                   ^~~~~~~~~~~~~~
include/linux/tpm_eventlog.h:207:4: note: in expansion of macro 'TPM_MEMUNM=
AP'
    TPM_MEMUNMAP(mapping, mapping_size);
    ^~~~~~~~~~~~
In file included from drivers/firmware/efi/tpm.c:13:
include/linux/tpm_eventlog.h:209:12: warning: assignment to 'void *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
    mapping =3D TPM_MEMREMAP((unsigned long)marker,
            ^
include/linux/tpm_eventlog.h:243:11: warning: assignment to 'void *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
   mapping =3D TPM_MEMREMAP((unsigned long)marker,
           ^
In file included from ./arch/arm/include/generated/asm/early_ioremap.h:1,
                 from drivers/firmware/efi/tpm.c:15:
include/asm-generic/early_ioremap.h: At top level:
include/asm-generic/early_ioremap.h:13:14: error: conflicting types for 'ea=
rly_memremap'
 extern void *early_memremap(resource_size_t phys_addr,
              ^~~~~~~~~~~~~~
drivers/firmware/efi/tpm.c:7:35: note: previous implicit declaration of 'ea=
rly_memremap' was here
 #define TPM_MEMREMAP(start, size) early_memremap(start, size)
                                   ^~~~~~~~~~~~~~
include/linux/tpm_eventlog.h:182:13: note: in expansion of macro 'TPM_MEMRE=
MAP'
   mapping =3D TPM_MEMREMAP((unsigned long)marker_start,
             ^~~~~~~~~~~~
In file included from ./arch/arm/include/generated/asm/early_ioremap.h:1,
                 from drivers/firmware/efi/tpm.c:15:
include/asm-generic/early_ioremap.h:20:13: warning: conflicting types for '=
early_memunmap'
 extern void early_memunmap(void *addr, unsigned long size);
             ^~~~~~~~~~~~~~
drivers/firmware/efi/tpm.c:8:35: note: previous implicit declaration of 'ea=
rly_memunmap' was here
 #define TPM_MEMUNMAP(start, size) early_memunmap(start, size)
                                   ^~~~~~~~~~~~~~
include/linux/tpm_eventlog.h:207:4: note: in expansion of macro 'TPM_MEMUNM=
AP'
    TPM_MEMUNMAP(mapping, mapping_size);
    ^~~~~~~~~~~~
drivers/firmware/efi/tpm.c: In function 'efi_tpm_eventlog_init':
drivers/firmware/efi/tpm.c:81:10: warning: passing argument 1 of 'tpm2_calc=
_event_log_size' makes pointer from integer without a cast [-Wint-conversio=
n]
  tbl_size =3D tpm2_calc_event_log_size(efi.tpm_final_log
                                      ~~~~~~~~~~~~~~~~~
          + sizeof(final_tbl->version)
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          + sizeof(final_tbl->nr_events),
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/firmware/efi/tpm.c:20:43: note: expected 'void *' but argument is o=
f type 'long unsigned int'
 static int tpm2_calc_event_log_size(void *data, int count, void *size_info)
                                     ~~~~~~^~~~
cc1: some warnings being treated as errors

Caused by commit

  b25b956d13d5 ("tpm: Reserve the TPM final events table")

I have used the tpmdd tree from next-20190604 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Gb31PL/gttZQcWVCL4d94hY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz3JGoACgkQAVBC80lX
0GxZJQf/VdioND2pmbnKziKHT63gh5B4gQlwbhX5DiLduP2le3dnY53nt1IC8h5K
VBYdGTQ/UpaQHJ2vPj3JL00lEAYzQVkVOb5zbME8l1teqsgRcRf9Z4tWYypu9Qe2
ey48XkW4dKqtx2aQavn/6vb9Q6U4bXad7F17y5DtBU9T+3PE8BiAvbd1b6kLsovL
GCuhXRLHi5Sa2K/uVIFEr3wpLf5jBzl4/OZfV+Z98Z3z5b+g/plQlhm10pJFg50B
sLe1gitKyc73JfUCGC6a0bfqM5PO/eZ7aRGbvzrSDSPV6V8/jtzqip6a66SbCIMD
Q4jszoxkKOPLjLp2JktmjGf4dkIYsw==
=pU8e
-----END PGP SIGNATURE-----

--Sig_/Gb31PL/gttZQcWVCL4d94hY--
