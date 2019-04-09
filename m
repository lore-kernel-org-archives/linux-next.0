From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the printk tree with Linus' tree
Date: Wed, 10 Apr 2019 09:29:01 +1000
Message-ID: <20190410092901.0a17ee79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JLyIHtWwlpc=v2NS3d+BDIx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JLyIHtWwlpc=v2NS3d+BDIx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the printk tree got a conflict in:

  include/trace/events/sunrpc.h

between commit:

  6f701383368d ("SUNRPC: Display symbolic flag names in RPC trace events")

from Linus' tree and commit:

  d75f773c86a2 ("treewide: Switch printk users from %pf and %pF to %ps and =
%pS, respectively")

from the printk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/trace/events/sunrpc.h
index 7e899e635d33,7b8b987d332e..000000000000
--- a/include/trace/events/sunrpc.h
+++ b/include/trace/events/sunrpc.h
@@@ -146,10 -102,10 +146,10 @@@ DECLARE_EVENT_CLASS(rpc_task_running
  		__entry->flags =3D task->tk_flags;
  		),
 =20
- 	TP_printk("task:%u@%d flags=3D%s runstate=3D%s status=3D%d action=3D%pf",
 -	TP_printk("task:%u@%d flags=3D%4.4x state=3D%4.4lx status=3D%d action=3D=
%ps",
++	TP_printk("task:%u@%d flags=3D%s runstate=3D%s status=3D%d action=3D%ps",
  		__entry->task_id, __entry->client_id,
 -		__entry->flags,
 -		__entry->runstate,
 +		rpc_show_task_flags(__entry->flags),
 +		rpc_show_runstate(__entry->runstate),
  		__entry->status,
  		__entry->action
  		)

--Sig_/JLyIHtWwlpc=v2NS3d+BDIx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlytKr4ACgkQAVBC80lX
0GxVFgf/SidMM7NNcSNHCA1rIMrV0RjSRiC8V+f1o0oliCRjuzWGFWaNPK7Py1EW
qa3OVIX7tFsp9lpDg4KhsXfgR/+Wr1/j3pejrE7P3B2QKuls1YkvTXj9b57XkJk8
mSeQv2Sy+GiB+Ch3xLvOiYiYjYQ12lLALZG56ZyEzGInW8mIQnTS+mfummVYdm4u
amN3dDAaDbqVOlI4dOV27euRn07Y+/cbDKz7jE3lcrdacPNhInVTOAikjSVDqkW2
SxsnMsF/9j33hYxjQ0VFKCydlnQqCzlLCkVK8bvXajwiIzsVr9H1h28q8yX4PPDL
Z69gWzSf+pPreLt2HX6ukdKmI1oGww==
=uGU0
-----END PGP SIGNATURE-----

--Sig_/JLyIHtWwlpc=v2NS3d+BDIx--
