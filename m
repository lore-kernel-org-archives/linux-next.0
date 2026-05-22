Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C643803EB;
	Fri, 22 May 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452696; cv=none; b=mcfP6fQTfUNsY8LEw0KCV2dxE5XeV82TCyAEebZV3vR9fxLFOcVP/BUNRDCnSj3e7ukfxtkriedDngO9rTR0/v1n6kYJVN4W3RPG4N4yv7cGJ0ezUPNlF5zMaS5/ZQbXOPRDqxhmIMuJjZotu3V7tbgKDay4/jr513cr8Abml0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452696; c=relaxed/simple;
	bh=uEQojA/dFGV96BBWahBrNgxfyIkIAcV4ZHtKgOzqYaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N8PIVeHAOLcFXw134ox6bZvw7y5R16hu6smqJfP3Wrs7QBtD6QuFf0i1xVUyZNJJc9jQjA6i8/ybOZ05WMAqB0ZJZPzDVKhUa4hnAwJdrsfJKE8/uR484y6L2AJ3MZREnU8a3nUy2qfNJlJ53tM+owkaFYwGUq6BTZ1DTlfi7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1PtfetF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1PtfetF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF6E1F000E9;
	Fri, 22 May 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779452695;
	bh=jmgdW3cjFD4fXpsMYPAlxQV7xN7ToRPMZjse1cdBiiE=;
	h=Date:From:To:Cc:Subject;
	b=U1PtfetFyRH84SPYbbVEIA1b6ayqlBCxnqzTrkc4K+SxtC3GpExYYDq1b8DnBk3yf
	 33i/tssStxdaOBzdk6TcbDXl+oMH/1Kx9PDQ7Cbs0uF7FX6s+EciJHu3W3LKYqZK82
	 cKwgkOJdQpC2y2mf+wyp0WJR25tRk5retLC3t01ICSVKHWUaxsU2uDvuzrTM6Ko4/k
	 MsP3V2CCV97exT5J5vppfd+vjyzuyA0uXDfyZuE2yEngi0riZA3FJulCURx2J4PoPe
	 72ycyqvZw2BaZFiMitIE7kJ8D9E50dkV4vysf/4trmx0wnl9T5uYaisMGLg2khoAAp
	 u2xpBlpYAzk+g==
Date: Fri, 22 May 2026 13:24:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Horman <horms@verge.net.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Safa =?utf-8?Q?Karaku=C5=9F?= <safa.karakus@secunnix.com>,
	Siwei Zhang <oss@fourdim.xyz>
Subject: linux-next: manual merge of the ipvs-next tree with the origin tree
Message-ID: <ahBLEyBtclVUG9rt@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9IjUPrKm85Jrtm/i"
Content-Disposition: inline


--9IjUPrKm85Jrtm/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipvs-next tree got a conflict in:

  net/bluetooth/l2cap_sock.c

between commits:

  2ff1a41a912de ("Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_state_=
change_cb()")
  78a88d43dab8d ("Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_get_sn=
dtimeo_cb()")
  0a120d9616630 ("Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_new_co=
nnection_cb()")
  ab1513597c6cf ("Bluetooth: fix UAF in l2cap_sock_cleanup_listen() vs l2ca=
p_conn_del()")

=66rom the origin tree and commits:

  da5bd8be1bd5a ("Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_state_=
change_cb()")
  11bc757180ef5 ("Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_get_sn=
dtimeo_cb()")
  91fa64f09e55b ("Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_new_co=
nnection_cb()")
  0b580042a1a54 ("Bluetooth: fix UAF in l2cap_sock_cleanup_listen() vs l2ca=
p_conn_del()")
  75780ca4c6a87 ("Bluetooth: L2CAP: use chan timer to close channels in cle=
anup_listen()")

=66rom the ipvs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Commits that are in other trees, especially in Linus' tree, *really*
shouldn't be getting rebased or cherry picked.

diff --combined net/bluetooth/l2cap_sock.c
index b34e7da8d9067,025329636353d..0000000000000
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@@ -31,6 -31,7 +31,7 @@@
  #include <linux/export.h>
  #include <linux/filter.h>
  #include <linux/sched/signal.h>
+ #include <linux/uio.h>
 =20
  #include <net/bluetooth/bluetooth.h>
  #include <net/bluetooth/hci_core.h>
@@@ -438,7 -439,7 +439,7 @@@ static int l2cap_get_mode(struct l2cap_
  }
 =20
  static int l2cap_sock_getsockopt_old(struct socket *sock, int optname,
- 				     char __user *optval, int __user *optlen)
+ 				     sockopt_t *sopt)
  {
  	struct sock *sk =3D sock->sk;
  	struct l2cap_chan *chan =3D l2cap_pi(sk)->chan;
@@@ -450,8 -451,7 +451,7 @@@
 =20
  	BT_DBG("sk %p", sk);
 =20
- 	if (get_user(len, optlen))
- 		return -EFAULT;
+ 	len =3D sopt->optlen;
 =20
  	lock_sock(sk);
 =20
@@@ -493,7 -493,7 +493,7 @@@
  		BT_DBG("mode 0x%2.2x", chan->mode);
 =20
  		len =3D min(len, sizeof(opts));
- 		if (copy_to_user(optval, (char *) &opts, len))
+ 		if (copy_to_iter(&opts, len, &sopt->iter_out) !=3D len)
  			err =3D -EFAULT;
 =20
  		break;
@@@ -525,7 -525,8 +525,8 @@@
  		if (test_bit(FLAG_FORCE_RELIABLE, &chan->flags))
  			opt |=3D L2CAP_LM_RELIABLE;
 =20
- 		if (put_user(opt, (u32 __user *) optval))
+ 		if (copy_to_iter(&opt, sizeof(opt), &sopt->iter_out) !=3D
+ 		    sizeof(opt))
  			err =3D -EFAULT;
 =20
  		break;
@@@ -543,7 -544,7 +544,7 @@@
  		memcpy(cinfo.dev_class, chan->conn->hcon->dev_class, 3);
 =20
  		len =3D min(len, sizeof(cinfo));
- 		if (copy_to_user(optval, (char *) &cinfo, len))
+ 		if (copy_to_iter(&cinfo, len, &sopt->iter_out) !=3D len)
  			err =3D -EFAULT;
 =20
  		break;
@@@ -558,25 -559,26 +559,26 @@@
  }
 =20
  static int l2cap_sock_getsockopt(struct socket *sock, int level, int optn=
ame,
- 				 char __user *optval, int __user *optlen)
+ 				 sockopt_t *sopt)
  {
  	struct sock *sk =3D sock->sk;
  	struct l2cap_chan *chan =3D l2cap_pi(sk)->chan;
  	struct bt_security sec;
  	struct bt_power pwr;
- 	u32 phys;
  	int len, mode, err =3D 0;
+ 	u32 opt;
+ 	u16 mtu;
+ 	u8 mval;
 =20
  	BT_DBG("sk %p", sk);
 =20
  	if (level =3D=3D SOL_L2CAP)
- 		return l2cap_sock_getsockopt_old(sock, optname, optval, optlen);
+ 		return l2cap_sock_getsockopt_old(sock, optname, sopt);
 =20
  	if (level !=3D SOL_BLUETOOTH)
  		return -ENOPROTOOPT;
 =20
- 	if (get_user(len, optlen))
- 		return -EFAULT;
+ 	len =3D sopt->optlen;
 =20
  	lock_sock(sk);
 =20
@@@ -600,7 -602,7 +602,7 @@@
  		}
 =20
  		len =3D min_t(unsigned int, len, sizeof(sec));
- 		if (copy_to_user(optval, (char *) &sec, len))
+ 		if (copy_to_iter(&sec, len, &sopt->iter_out) !=3D len)
  			err =3D -EFAULT;
 =20
  		break;
@@@ -611,15 -613,17 +613,17 @@@
  			break;
  		}
 =20
- 		if (put_user(test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags),
- 			     (u32 __user *) optval))
+ 		opt =3D test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
+ 		if (copy_to_iter(&opt, sizeof(opt), &sopt->iter_out) !=3D
+ 		    sizeof(opt))
  			err =3D -EFAULT;
 =20
  		break;
 =20
  	case BT_FLUSHABLE:
- 		if (put_user(test_bit(FLAG_FLUSHABLE, &chan->flags),
- 			     (u32 __user *) optval))
+ 		opt =3D test_bit(FLAG_FLUSHABLE, &chan->flags);
+ 		if (copy_to_iter(&opt, sizeof(opt), &sopt->iter_out) !=3D
+ 		    sizeof(opt))
  			err =3D -EFAULT;
 =20
  		break;
@@@ -634,13 -638,15 +638,15 @@@
  		pwr.force_active =3D test_bit(FLAG_FORCE_ACTIVE, &chan->flags);
 =20
  		len =3D min_t(unsigned int, len, sizeof(pwr));
- 		if (copy_to_user(optval, (char *) &pwr, len))
+ 		if (copy_to_iter(&pwr, len, &sopt->iter_out) !=3D len)
  			err =3D -EFAULT;
 =20
  		break;
 =20
  	case BT_CHANNEL_POLICY:
- 		if (put_user(chan->chan_policy, (u32 __user *) optval))
+ 		opt =3D chan->chan_policy;
+ 		if (copy_to_iter(&opt, sizeof(opt), &sopt->iter_out) !=3D
+ 		    sizeof(opt))
  			err =3D -EFAULT;
  		break;
 =20
@@@ -655,7 -661,9 +661,9 @@@
  			break;
  		}
 =20
- 		if (put_user(chan->omtu, (u16 __user *) optval))
+ 		mtu =3D chan->omtu;
+ 		if (copy_to_iter(&mtu, sizeof(mtu), &sopt->iter_out) !=3D
+ 		    sizeof(mtu))
  			err =3D -EFAULT;
  		break;
 =20
@@@ -665,7 -673,9 +673,9 @@@
  			break;
  		}
 =20
- 		if (put_user(chan->imtu, (u16 __user *) optval))
+ 		mtu =3D chan->imtu;
+ 		if (copy_to_iter(&mtu, sizeof(mtu), &sopt->iter_out) !=3D
+ 		    sizeof(mtu))
  			err =3D -EFAULT;
  		break;
 =20
@@@ -675,9 -685,10 +685,10 @@@
  			break;
  		}
 =20
- 		phys =3D hci_conn_get_phy(chan->conn->hcon);
+ 		opt =3D hci_conn_get_phy(chan->conn->hcon);
 =20
- 		if (put_user(phys, (u32 __user *) optval))
+ 		if (copy_to_iter(&opt, sizeof(opt), &sopt->iter_out) !=3D
+ 		    sizeof(opt))
  			err =3D -EFAULT;
  		break;
 =20
@@@ -698,7 -709,9 +709,9 @@@
  			break;
  		}
 =20
- 		if (put_user(mode, (u8 __user *) optval))
+ 		mval =3D mode;
+ 		if (copy_to_iter(&mval, sizeof(mval), &sopt->iter_out) !=3D
+ 		    sizeof(mval))
  			err =3D -EFAULT;
  		break;
 =20
@@@ -1499,6 -1512,10 +1512,10 @@@ static void l2cap_sock_cleanup_listen(s
  	 * pin it (hold_unless_zero() additionally skips a chan already past
  	 * its last reference).  We then drop the sk lock before taking
  	 * chan->lock, so sk and chan locks are never held together.
+ 	 *
+ 	 * Since we cannot call l2cap_chan_close() without conn->lock,
+ 	 * schedule l2cap_chan_timeout to close the channel; it already
+ 	 * acquires conn->lock -> chan->lock in the correct order.
  	 */
  	while ((sk =3D bt_accept_dequeue(parent, NULL))) {
  		struct l2cap_chan *chan;
@@@ -1516,14 -1533,12 +1533,12 @@@
  		       state_to_string(chan->state));
 =20
  		l2cap_chan_lock(chan);
- 		__clear_chan_timer(chan);
- 		l2cap_chan_close(chan, ECONNRESET);
- 		/* l2cap_conn_del() may already have killed this socket
- 		 * (it sets SOCK_DEAD); skip the duplicate to avoid a
- 		 * double sock_put()/l2cap_chan_put().
+ 		/* Since we cannot call l2cap_chan_close() without
+ 		 * conn->lock, schedule its timer to trigger the close
+ 		 * and cleanup of this channel.
  		 */
- 		if (!sock_flag(sk, SOCK_DEAD))
- 			l2cap_sock_kill(sk);
+ 		if (chan->conn)
+ 			__set_chan_timer(chan, 0);
  		l2cap_chan_unlock(chan);
 =20
  		l2cap_chan_put(chan);
@@@ -2037,7 -2052,7 +2052,7 @@@ static const struct proto_ops l2cap_soc
  	.socketpair	=3D sock_no_socketpair,
  	.shutdown	=3D l2cap_sock_shutdown,
  	.setsockopt	=3D l2cap_sock_setsockopt,
- 	.getsockopt	=3D l2cap_sock_getsockopt
+ 	.getsockopt_iter =3D l2cap_sock_getsockopt
  };
 =20
  static const struct net_proto_family l2cap_sock_family_ops =3D {

--9IjUPrKm85Jrtm/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQSxIACgkQJNaLcl1U
h9AHhwf/aAmoQjfy0CYcIh9vQTDzWBVvGcF1ktJkHt8uumyqYvLLSPeA4+AfSbzk
kESU1n910Nxlvz+nOQRWylntSY5AovBiZpXcRWRS2jdOTTNJAnv3u4/ImVlWfBkC
cMOEnwSnwjWwZMcJTLpD9IPBYXy8w6w2hX4Gr9pa3bdrMqivsX5WXZv16DWcHipZ
RyRZqw6Guv6I22e6gEiALQ+PgRIHubrNlWGv6E+4qE/Y/ZmzXe9rbwzzT4OSCqNj
r6Eq6MKfdqASO+gYR//pc0NuuJB6MLqlGzOdoIYhP8L4qL9hWKn5sgx3p+avM6Mu
zh+R5eq2CTn1OwmLgrMgkEXfodvzmg==
=bOL9
-----END PGP SIGNATURE-----

--9IjUPrKm85Jrtm/i--
