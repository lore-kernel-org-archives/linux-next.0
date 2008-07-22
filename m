From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Fix icom serial compile.
Date: Tue, 22 Jul 2008 11:25:38 +1000
Message-ID: <20080722112538.03c06649.sfr@canb.auug.org.au>
References: <20080721211659.GA29106@redhat.com>
	<20080721221355.GD3472@redhat.com>
	<20080721230742.4649b94a@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_11_25_38_+1000_NDm6wyijXHi.U+7r"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57004 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750718AbYGVBZp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Jul 2008 21:25:45 -0400
In-Reply-To: <20080721230742.4649b94a@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Dave Jones <davej@redhat.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org

--Signature=_Tue__22_Jul_2008_11_25_38_+1000_NDm6wyijXHi.U+7r
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Mon, 21 Jul 2008 23:07:42 +0100 Alan Cox <alan@lxorguk.ukuu.org.uk> wrot=
e:
>
> On Mon, 21 Jul 2008 18:13:55 -0400
> Dave Jones <davej@redhat.com> wrote:
>=20
> > drivers/serial/icom.c: In function 'recv_interrupt':
> > drivers/serial/icom.c:733: error: 'struct uart_info' has no member name=
d 'tty'
> >=20
> > Signed-off-by: Dave Jones <davej@redhat.com>
>=20
> NAK. Already in the ttydev tree but not yet gone to Linus

I have just sent a similar patch.   I have to ask why you sent only some
of these patches since they were known to break some builds and you had
the fix patches already ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_11_25_38_+1000_NDm6wyijXHi.U+7r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFNxIACgkQjjKRsyhoI8xRuACgjsM35a8XcaoH2S574UHU/w6C
KHoAn2FuxUbMlEe5h9Mj05+I+ePSI7xe
=zfjK
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_11_25_38_+1000_NDm6wyijXHi.U+7r--
