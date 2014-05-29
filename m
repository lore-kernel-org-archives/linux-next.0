From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Thu, 29 May 2014 19:08:00 +1000
Message-ID: <20140529190800.1d5f6ef7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F9c8TILyZzSO8n0oBMX4=/4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fabian Frederick <fabf@skynet.be>
List-Id: linux-next.vger.kernel.org

--Sig_/F9c8TILyZzSO8n0oBMX4=/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
kernel/kexec.c between commit 011e4b02f1da ("powerpc, kexec: Fix
"Processor X is stuck" issue during kexec from ST mode") from Linus'
tree and commit 51950fcb6d27 ("kernel/kexec.c: convert printk to
pr_foo()") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/kexec.c
index 28c57069ef68,bf0b929e7f94..000000000000
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@@ -1683,15 -1679,7 +1679,15 @@@ int kernel_kexec(void
  		kexec_in_progress =3D true;
  		kernel_restart_prepare(NULL);
  		migrate_to_reboot_cpu();
 +
 +		/*
 +		 * migrate_to_reboot_cpu() disables CPU hotplug assuming that
 +		 * no further code needs to use CPU hotplug (which is true in
 +		 * the reboot case). However, the kexec path depends on using
 +		 * CPU hotplug again; so re-enable it here.
 +		 */
 +		cpu_hotplug_enable();
- 		printk(KERN_EMERG "Starting new kernel\n");
+ 		pr_emerg("Starting new kernel\n");
  		machine_shutdown();
  	}
 =20

--Sig_/F9c8TILyZzSO8n0oBMX4=/4
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJThvj1AAoJEMDTa8Ir7ZwVFD0P/jd+RfbaMqLmfLJe6alAc5O7
A2OTXTxr07tJ1D4wzNGNkD7aNydLmV7V1mVu+kuBlGWDrL731nELJ3ppd8As03pM
2Lt1Gp/Y/vFHL2N1FF+aVCCxrOFm387wR00mW2sdezQVFK+n1jcuUuPniTEp++/O
FFj8hEmpQlQnV1UOhBFn6jMj/ttnBI8kFsq3fdE1lz507YjQptHPAGo5yS8mYGkO
ZqEd8HuJR7qedVtMTPBjSXZnVNfkos+nW6vr67Dp80JpvVjh1NwGsOziFT8GHZFD
oyWto2ECeenAgNZ1yZ41wnhwDM81n2vBIYzwHV5CXQu0dVByCTZW2yxMwrf08hKz
n/2vgyFQi5xMFBLkhFyUGMGZqx7/HvUxdKz/KwowgIOg2zp7ijYOhH83I55IFEgL
rLhV1QzWFbdtXnhiihfSwzl5OEqSms1m6+XM/znGzw0Rux0Qqe0rlXmdv9g7sgPI
3hBrOwO0/KDki9g05KzxpDdLfYthH0BOaK5iFNEi3XDM9MKfEbFaozX3aGzOf2bP
PyJWSxBqV8rPc3XugUly+mzNVPWRiFertUVtikNajbDil8e1LW2XKMopz8AxgxXg
3YmXWL0/CuEecsPs6Md/l5/ookxKw3wr1HMSu+S4K33SqoNKdUzywXU52tAV6VnX
bVelajLFA6pDvk2sOGQ7
=P4mB
-----END PGP SIGNATURE-----

--Sig_/F9c8TILyZzSO8n0oBMX4=/4--
