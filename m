From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Tue, 16 Dec 2008 17:09:40 +1100
Message-ID: <20081216170940.3c74d4d0.sfr@canb.auug.org.au>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au>
	<200812151711.36134.rusty@rustcorp.com.au>
	<4946855D.7070403@sgi.com>
	<200812161610.58496.rusty@rustcorp.com.au>
	<49474471.2090409@sgi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__16_Dec_2008_17_09_40_+1100_PKjA++8NsqFT4gkl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60233 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbYLPGJt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 01:09:49 -0500
In-Reply-To: <49474471.2090409@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

--Signature=_Tue__16_Dec_2008_17_09_40_+1100_PKjA++8NsqFT4gkl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Mon, 15 Dec 2008 22:02:25 -0800 Mike Travis <travis@sgi.com> wrote:
>
> Yes, I did finally figure that out.  Thanks for rebasing the part that In=
go needed
> so maybe the rest can be pushed.  There was a problem when the 'for-ingo'=
 tree was
> merged as there were mixed up API calls in io_apic.c, but I fixed them in=
 the first
> x86 only patch.  I wasn't sure of what else to do.

You could have fixed them up as part of the actual merge commit.  If each
tree was correct on it own, then the merge is the place for such
resolutions.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__16_Dec_2008_17_09_40_+1100_PKjA++8NsqFT4gkl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklHRiQACgkQjjKRsyhoI8zvjgCcD9uPq7mWqMW84LUTGvPYbycP
K58An3fq1Znx9DJh3jGF6gi7Ter/woDj
=K7RM
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Dec_2008_17_09_40_+1100_PKjA++8NsqFT4gkl--
