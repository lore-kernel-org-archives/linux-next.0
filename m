From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Wed, 15 Aug 2018 14:04:16 +1000
Message-ID: <20180815140416.200fd873@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gVAgX7Kb+mYpBsve7JXvxyX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tobias Tefke <tobias.tefke@gmail.com>, Ingo Molnar <mingo@kernel.org>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gVAgX7Kb+mYpBsve7JXvxyX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steven,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/events/uprobes.c

between commit:

  788faab70d5a ("perf, tools: Use correct articles in comments")

from Linus' tree and commit:

  38e967ae1e60 ("Uprobes: Simplify uprobe_register() body")

from the ftrace tree.

I fixed it up (the latter moved the uprobe_unregister function - see
below) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/events/uprobes.c
index aed1ba569954,c0418ba52ba8..000000000000
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@@ -860,7 -856,28 +856,28 @@@ __uprobe_unregister(struct uprobe *upro
  }
 =20
  /*
-  * uprobe_register - register a probe
 - * uprobe_unregister - unregister a already registered probe.
++ * uprobe_unregister - unregister an already registered probe.
+  * @inode: the file in which the probe has to be removed.
+  * @offset: offset from the start of the file.
+  * @uc: identify which probe if multiple probes are colocated.
+  */
+ void uprobe_unregister(struct inode *inode, loff_t offset, struct uprobe_=
consumer *uc)
+ {
+ 	struct uprobe *uprobe;
+=20
+ 	uprobe =3D find_uprobe(inode, offset);
+ 	if (WARN_ON(!uprobe))
+ 		return;
+=20
+ 	down_write(&uprobe->register_rwsem);
+ 	__uprobe_unregister(uprobe, uc);
+ 	up_write(&uprobe->register_rwsem);
+ 	put_uprobe(uprobe);
+ }
+ EXPORT_SYMBOL_GPL(uprobe_unregister);
+=20
+ /*
+  * __uprobe_register - register a probe
   * @inode: the file in which the probe has to be placed.
   * @offset: offset from the start of the file.
   * @uc: information on howto handle the probe..

--Sig_/gVAgX7Kb+mYpBsve7JXvxyX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltzpkAACgkQAVBC80lX
0GxxRgf/Q7J755A4ifHF3e6c0oHwsvlSzs2wB+Sv8jTCeCq57rt2DF6kivlWbsm1
TS3O6MRrB1DGv25VMk6xg4/Wxg5c2qWMX/GZbCNrVFv9zyRcdr3jOocaDypDXNRN
OXk7MpvNUwIu/tZK90tOp4DvnL3yq4R3VFXAlCdqE2vQeIV7FxAa4IfcPqw6L2Ei
Sby0JZNe/E0V7hEKF8HEtgNfreiG97XxjOH/RD15HEHSkhWyVXuktbfFBupRA7Y0
vWvrD3zQ0WfxP8eKohDP1Q1XDoDSPotEW0yDrUcZqsnlPPZrBQTLYBMstHmRRiNr
GtqbKy59SaPPt1AMC2WzfT51BOoixg==
=RkdF
-----END PGP SIGNATURE-----

--Sig_/gVAgX7Kb+mYpBsve7JXvxyX--
