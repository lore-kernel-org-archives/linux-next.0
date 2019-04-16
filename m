From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tpmdd tree
Date: Tue, 16 Apr 2019 13:07:40 +1000
Message-ID: <20190416130740.7ff9e561@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/R4VDdDOj84NdA8uEha7ASeV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/R4VDdDOj84NdA8uEha7ASeV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

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
include/linux/tpm_eventlog.h:203:4: note: in expansion of macro 'TPM_MEMUNM=
AP'
    TPM_MEMUNMAP(mapping, mapping_size);
    ^~~~~~~~~~~~
In file included from drivers/firmware/efi/tpm.c:13:
include/linux/tpm_eventlog.h:205:12: warning: assignment to 'void *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
    mapping =3D TPM_MEMREMAP((unsigned long)marker_start,
            ^
include/linux/tpm_eventlog.h:225:14: warning: assignment to 'void *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
      mapping =3D TPM_MEMREMAP((unsigned long)marker_start,
              ^
include/linux/tpm_eventlog.h:251:11: warning: assignment to 'void *' from '=
int' makes pointer from integer without a cast [-Wint-conversion]
   mapping =3D TPM_MEMREMAP((unsigned long)marker_start,
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
include/linux/tpm_eventlog.h:203:4: note: in expansion of macro 'TPM_MEMUNM=
AP'
    TPM_MEMUNMAP(mapping, mapping_size);
    ^~~~~~~~~~~~

Caused by commit

  05165bf3d231 ("tpm: Abstract crypto agile event size calculations")

and maybe

  cdb75b359079 ("tpm: Reserve the TPM final events table")

I have used the tmpdd tree from next-20190415 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/R4VDdDOj84NdA8uEha7ASeV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1RvwACgkQAVBC80lX
0Gz5Ygf/VWqIWSOEQkMqZuZQ11MaN6oos1dgokn06sirX2N/MbBt777v/FZXjm6M
snrj7k1rfjBgLXxWXwZCp3jpmaNmYP1rUdWj41FTYi9ln0owBpAwexWCYFtiHzmb
khhdnggmyjroyadMhk9PogYvxAqQszoJ6KP4eRb2qy1hW8vRMLIFHUqpRayI9KKP
YymzZum7PNylCarqzTjNoXL8pozYdOjv6QjAvUA6Tv96DLBo+Kwx6YZgFeFCXNxa
GPsj8Lw8ubGMTnfuoRv8SYZ97Av+RXhGBcle6PuWgxVGbFzmRJKFjGK0cq66cEzW
nlKn4a3y8xV0FEMppXpPo6oNk4SRTA==
=5O9A
-----END PGP SIGNATURE-----

--Sig_/R4VDdDOj84NdA8uEha7ASeV--
