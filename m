From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Fri, 21 Dec 2018 16:16:29 +1100
Message-ID: <20181221161629.34429a4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1Tu+T81aBrhnsG8kUuDRLI+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suraj Jitindar Singh <sjitindarsingh@gmail.com>, Paul Mackerras <paulus@ozlabs.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/1Tu+T81aBrhnsG8kUuDRLI+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/powerpc/mm/fault.c

between commit:

  49a502ea23bf ("powerpc/mm: Make NULL pointer deferences explicit on bad p=
age faults.")

from the powerpc tree and commit:

  d7b456152230 ("KVM: PPC: Book3S HV: Implement functions to access quadran=
ts 1 & 2")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/fault.c
index c866d9a710fe,2e6fb1d758c3..000000000000
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@@ -650,9 -636,9 +650,10 @@@ void bad_page_fault(struct pt_regs *reg
  	switch (TRAP(regs)) {
  	case 0x300:
  	case 0x380:
+ 	case 0xe00:
 -		printk(KERN_ALERT "Unable to handle kernel paging request for "
 -			"data at address 0x%08lx\n", regs->dar);
 +		pr_alert("BUG: %s at 0x%08lx\n",
 +			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
 +			 "Unable to handle kernel data access", regs->dar);
  		break;
  	case 0x400:
  	case 0x480:

--Sig_/1Tu+T81aBrhnsG8kUuDRLI+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwcdy0ACgkQAVBC80lX
0Gz55Af9Hb0oQbR+WvZr//StQJa+AP0WJs9+QGPFONEX7LjCCwESIjKRB4nXvD/Z
jy57wyBzJd4SyfkTnzmJfGgwYl55kP+ALq8eoWLjhuzt+qNqLdWssdCYu87R6KEl
Vy7JzK1Uld8m/fymRKLh9w/b8aev06qcuZ1GfLclvT+LJXk9xlLISzMAnpfdcp8V
TrVaqJHEGicH/Bsbmp6kVPXchgyAzaeLxQuG0uKExCofD8OUhSzvdoRJxwGbaQaC
NhPOobXXOpyGNVYcxWVyqOQLeKYNDdJf7ZApotpm2hbZVwkeYVgHyyuMehV6+JFt
0admZHYABDZz52XVC/EIZ167n270aQ==
=uXXL
-----END PGP SIGNATURE-----

--Sig_/1Tu+T81aBrhnsG8kUuDRLI+--
