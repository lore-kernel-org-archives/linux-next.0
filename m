From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kselftest tree with the kvm tree
Date: Thu, 18 Oct 2018 15:50:30 +1100
Message-ID: <20181018155030.1d75c506@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.fE9TnzSs_tbWoRbOuSX.4_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrea Parri <andrea.parri@amarulasolutions.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.fE9TnzSs_tbWoRbOuSX.4_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Today's linux-next merge of the kselftest tree got a conflict in:

  tools/testing/selftests/kvm/dirty_log_test.c

between commit:

  fff8dcd7b4a2 ("kvm: selftests: port dirty_log_test to aarch64")

from the kvm tree and commit:

  cda94d9ffa0e ("selftests: kvm: Fix -Wformat warnings")

from the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/kvm/dirty_log_test.c
index d59820cc2d39,a9c4b5e21d7e..000000000000
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@@ -17,52 -15,46 +17,52 @@@
 =20
  #include "test_util.h"
  #include "kvm_util.h"
 +#include "processor.h"
 +
 +#define DEBUG printf
 =20
 -#define  DEBUG                 printf
 +#define VCPU_ID				1
 =20
 -#define  VCPU_ID                        1
  /* The memory slot index to track dirty pages */
 -#define  TEST_MEM_SLOT_INDEX            1
 -/*
 - * GPA offset of the testing memory slot. Must be bigger than the
 - * default vm mem slot, which is DEFAULT_GUEST_PHY_PAGES.
 - */
 -#define  TEST_MEM_OFFSET                (1ULL << 30) /* 1G */
 -/* Size of the testing memory slot */
 -#define  TEST_MEM_PAGES                 (1ULL << 18) /* 1G for 4K pages */
 +#define TEST_MEM_SLOT_INDEX		1
 +
 +/* Default guest test memory offset, 1G */
 +#define DEFAULT_GUEST_TEST_MEM		0x40000000
 +
  /* How many pages to dirty for each guest loop */
 -#define  TEST_PAGES_PER_LOOP            1024
 +#define TEST_PAGES_PER_LOOP		1024
 +
  /* How many host loops to run (one KVM_GET_DIRTY_LOG for each loop) */
- #define TEST_HOST_LOOP_N		32
 -#define  TEST_HOST_LOOP_N               32UL
++#define TEST_HOST_LOOP_N		32UL
 +
  /* Interval for each host loop (ms) */
- #define TEST_HOST_LOOP_INTERVAL		10
 -#define  TEST_HOST_LOOP_INTERVAL        10UL
++#define TEST_HOST_LOOP_INTERVAL		10UL
 +
 +/*
 + * Guest/Host shared variables. Ensure addr_gva2hva() and/or
 + * sync_global_to/from_guest() are used when accessing from
 + * the host. READ/WRITE_ONCE() should also be used with anything
 + * that may change.
 + */
 +static uint64_t host_page_size;
 +static uint64_t guest_page_size;
 +static uint64_t guest_num_pages;
 +static uint64_t random_array[TEST_PAGES_PER_LOOP];
 +static uint64_t iteration;
 =20
  /*
 - * Guest variables.  We use these variables to share data between host
 - * and guest.  There are two copies of the variables, one in host memory
 - * (which is unused) and one in guest memory.  When the host wants to
 - * access these variables, it needs to call addr_gva2hva() to access the
 - * guest copy.
 + * GPA offset of the testing memory slot. Must be bigger than
 + * DEFAULT_GUEST_PHY_PAGES.
   */
 -uint64_t guest_random_array[TEST_PAGES_PER_LOOP];
 -uint64_t guest_iteration;
 -uint64_t guest_page_size;
 +static uint64_t guest_test_mem =3D DEFAULT_GUEST_TEST_MEM;
 =20
  /*
 - * Writes to the first byte of a random page within the testing memory
 - * region continuously.
 + * Continuously write to the first 8 bytes of a random pages within
 + * the testing memory region.
   */
 -void guest_code(void)
 +static void guest_code(void)
  {
 -	int i =3D 0;
 -	uint64_t volatile *array =3D guest_random_array;
 -	uint64_t volatile *guest_addr;
 +	int i;
 =20
  	while (true) {
  		for (i =3D 0; i < TEST_PAGES_PER_LOOP; i++) {

--Sig_/.fE9TnzSs_tbWoRbOuSX.4_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvIERYACgkQAVBC80lX
0Gx8/AgAmPPFqSmmiJewMtJcvMqhEbrJEzL8yRKFVAg3VWzsgFpqU5XLUYfwsPuM
unKH+VxyqErgJ70cxO5mCWSy4t01OPXRdJT7OR1NfI3UQ8sYl9ZK9yoC41F0tivk
srTBO/Fuirlj/SRoMx1Vd9Th2JLUOaJ0k/RxpIChV0rpG6PUjKGQpecZi44/fwAX
AgFnH/irvI87LwvP9mkUevdnj3b081iYWrXWqDg+chDQnMLJ8oE1I9RB5Xna8f2R
aeOcrAfI6g4VGKlSH2eT04inOF2TKZFh0YBD7OJexRp3LTGOkC8XCjEwGdls/d7I
UfxCrBZ4AVJxiFinD761utt9LeJMuw==
=HFTw
-----END PGP SIGNATURE-----

--Sig_/.fE9TnzSs_tbWoRbOuSX.4_--
