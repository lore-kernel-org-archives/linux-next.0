From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Tue, 24 Feb 2015 11:27:01 +1100
Message-ID: <20150224112701.6b35d6f0@canb.auug.org.au>
References: <20150223102312.7029616b@canb.auug.org.au>
	<54EA8C99.50000@acm.org>
	<20150224072004.534ccb5a@canb.auug.org.au>
	<54EB9F33.6030702@acm.org>
	<20150224095449.243040b5@canb.auug.org.au>
	<54EBC09E.1000204@acm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EHO1ryaC0LquRukNNuH9=L4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37034 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752028AbbBXA1H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Feb 2015 19:27:07 -0500
In-Reply-To: <54EBC09E.1000204@acm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/EHO1ryaC0LquRukNNuH9=L4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Corey,

On Mon, 23 Feb 2015 18:06:54 -0600 Corey Minyard <minyard@acm.org> wrote:
>
> On 02/23/2015 04:54 PM, Stephen Rothwell wrote:
> > Hi Corey,
> >
> > On Mon, 23 Feb 2015 15:44:19 -0600 Corey Minyard <minyard@acm.org> wrot=
e:
> >> Sourcefoge is definitely having issues:
> >>
> >>     [cminyard@t430 linux-ipmi]$ git push origin for-next
> >>     fatal: '/git/p/openipmi/linux-ipmi' does not appear to be a git
> >>     repository
> >>     fatal: Could not read from remote repository.
> >>
> >>     Please make sure you have the correct access rights
> >>     and the repository exists.
> >>
> >> After a while it started working, and the tag was there.  I've verified
> >> that everything is ok from a different machine.
> > I see the problem.  I expect for-next to be a branch, but it is a tag.
> > It is a real pain to pull a tag into a shared tree like mine (there
> > could be a for-next tag in every tree I fetch from ...).
> Oops, I messed that up, I mixing up procedures.  It's fixed.

Excellent, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/EHO1ryaC0LquRukNNuH9=L4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU68VZAAoJEMDTa8Ir7ZwVNsEP/3Hg6YMc7p/AunjMWUnUkybZ
sjlOxLEy033hfOhQk3gCckKqZe/nNKqlo6tTEU7c50orNVR6DW+3DLV1MI75rHVN
MT0F77A7YtPSxN6sd7LOeq0lC7O3dD001DXU4fy0SQPk8Kmc/fRdksWI39c+B+J+
J9+owyrtsfcIwYYXCwIDZjkyr5Ub8t9bkgprv/8K/KKAy5WQhlLXlmCVKQ+origC
Df/NhLtwkkpQnJjnQagjpkPoWaJuCusrCiXCvFVE55+JyV+fFoPvhY8O4lcwOSrN
d3vimToOAkzZi07gchwXJndKX11jlnRkjBWZFWYesYThnFiA59JTSAOZqfJUa2wF
jYvY0KD2iPGkBGCk0JtTaQ0Sm9JOYwNBGZsQ8bzRJU9fVx16z8viEZEAX81vcX1n
jwosgFNJcK4EIXZRqezitCw+nIedOf8TVozsRqiDvrUHQpmgCdKVhn91zz6exv/P
brX6jYZpeiEpHarfrGCDkb+ktj8NaQv01jWOIW8zdipfSeNqFD9IJqftIHbi7q+Q
r7Sa6U/oMDPhQyRANzbhmNKYEZcHf9YBywnXK8wAVj76C0x5wejHUWZjCzO/XKRA
lAfAcxtXFxce9Rl+kXqZDmRzVc3Y/7jgMICabZLZJ6DNizhgKPWZK9pT99eh3ghK
x3DXelcxelwD5K830iXV
=ik19
-----END PGP SIGNATURE-----

--Sig_/EHO1ryaC0LquRukNNuH9=L4--
