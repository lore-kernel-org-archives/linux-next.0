From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 10 Jul 2008 14:02:12 +1000
Message-ID: <20080710140212.753c3bce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__10_Jul_2008_14_02_12_+1000_E/WJWZaKvXNH47xI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40012 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750795AbYGJEC0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Jul 2008 00:02:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Patrick McHardy <kaber@trash.net>

--Signature=_Thu__10_Jul_2008_14_02_12_+1000_E/WJWZaKvXNH47xI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
net/netfilter/nf_conntrack_proto_tcp.c between commit
6b69fe0c73c0f5a8dacf8f889db3cc9adee53649 ("netfilter: nf_conntrack_tcp:
fix endless loop") from the net-current tree and commit
51091764f26ec36c02e35166f083193a30f426fc ("netfilter: nf_conntrack: add
nf_ct_kill()") from the net tree.

Not a simple fixup.  I did what I thought was right, please check.

The conflict was in tcp_packet() and looked like this:

		if (((ct->proto.tcp.seen[dir].flags
		      | ct->proto.tcp.seen[!dir].flags)
		     & IP_CT_TCP_FLAG_CLOSE_INIT)
		    || (ct->proto.tcp.last_dir =3D=3D dir
		        && ct->proto.tcp.last_index =3D=3D TCP_RST_SET)) {
			/* Attempt to reopen a closed/aborted connection.
			 * Delete this connection and look up again. */
			write_unlock_bh(&tcp_lock);
<<<<<<< HEAD:net/netfilter/nf_conntrack_proto_tcp.c
			/* Only repeat if we can actually remove the timer.
			 * Destruction may already be in progress in process
			 * context and we must give it a chance to terminate.
			 */
			if (del_timer(&ct->timeout)) {
				ct->timeout.function((unsigned long)ct);
				return -NF_REPEAT;
			}
			return -NF_DROP;
=3D=3D=3D=3D=3D=3D=3D
			nf_ct_kill(ct);
			return -NF_REPEAT;
>>>>>>> net/master:net/netfilter/nf_conntrack_proto_tcp.c
		}
		/* Fall through */
	case TCP_CONNTRACK_IGNORE:

I used the HEAD version.  You may need to return a value from nf_ct_kill()
indicating if the timer was deleted to fix this properly.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__10_Jul_2008_14_02_12_+1000_E/WJWZaKvXNH47xI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh1icQACgkQjjKRsyhoI8xQLQCeK4DuyYsX6Fo8Q0jtiI4O7X7M
vX8AnRLx5pDwVJ7D7XOR45lgh1Xt8zja
=uHkK
-----END PGP SIGNATURE-----

--Signature=_Thu__10_Jul_2008_14_02_12_+1000_E/WJWZaKvXNH47xI--
