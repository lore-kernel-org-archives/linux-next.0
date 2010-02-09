From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the fsnotify tree with the vfs tree
Date: Tue, 9 Feb 2010 17:08:21 +1100
Message-ID: <20100209170821.9c664ccf.sfr@canb.auug.org.au>
References: <20100209163708.b7ae6d05.sfr@canb.auug.org.au>
	<20100209054521.GK30031@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Feb_2010_17_08_21_+1100_17g.RsIsde7rywfP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38262 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751853Ab0BIGI2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Feb 2010 01:08:28 -0500
In-Reply-To: <20100209054521.GK30031@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Eric Paris <eparis@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__9_Feb_2010_17_08_21_+1100_17g.RsIsde7rywfP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Tue, 9 Feb 2010 05:45:22 +0000 Al Viro <viro@ZenIV.linux.org.uk> wrote:
>
> FWIW, I've put two commits (audit_inode_child and fsnotify_move ones) into
> a new not-for-rebase branch (for-fsnotify) and told Eric, so hopefully
> he'll just pull it into fsnotify tree.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Feb_2010_17_08_21_+1100_17g.RsIsde7rywfP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktw+9UACgkQjjKRsyhoI8zXbACePfcpc+oLKAWn6CIRMc+BHCxP
7ywAoJ2dLhso0Xzht/0jxYwmZ+UAgXPw
=SNmh
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Feb_2010_17_08_21_+1100_17g.RsIsde7rywfP--
