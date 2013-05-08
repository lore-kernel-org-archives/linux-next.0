From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Wed, 8 May 2013 10:11:54 +1000
Message-ID: <20130508101154.05cd9327d7ebb0e7b9f82378@canb.auug.org.au>
References: <20130507112751.195757b78defdbea58aa6134@canb.auug.org.au>
	<CAKMK7uEr4Fs00nM3iuwwBdd+LV3_6w2sarR+i8tk02BrTHQmNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0092079454=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKMK7uEr4Fs00nM3iuwwBdd+LV3_6w2sarR+i8tk02BrTHQmNA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

--===============0092079454==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__8_May_2013_10_11_54_+1000_=0NLpcgQz7.Pqml="

--Signature=_Wed__8_May_2013_10_11_54_+1000_=0NLpcgQz7.Pqml=
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 7 May 2013 10:43:17 +0200 Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
>
> On Tue, May 7, 2013 at 3:27 AM, Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > Daniel, I assume all this stuff being added to the drm-intel tree is
> > going upstream very soon?
>=20
> Oops, no that is stuff for 3.11. Lazy me hoped I could sneak stuff
> through (since we just keep on merging features to
> drm-intel-next-queued to avoid stalls), but that's obviously not what
> you want for linux-next. My apologies for that mess. I've now created
> a for-linux-next branch which will not contain patches heading for
> 3.x+1 while 3.x-rc1 hasn't been released yet.
>=20
> Can you please switch over to that branch for inclusion into linux-next?

Done.  Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__8_May_2013_10_11_54_+1000_=0NLpcgQz7.Pqml=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRiZhKAAoJEECxmPOUX5FEHfYP/i9T1NEZgwsSA9PKpARo149/
jBTt9i4R5XkXIE3s3rqi9DA7qMRT3Dz8/ueEmna+iIAXGo2eq/rkOfm0jUI4Hh8n
ZFlL0IwqagrOOJYrBK6KIc8CLJRNFgRCvUSav3yrrG5zFxWgnpJBYIqd424t41VE
cCC9MEtiXMjvPz4Ju5TaRjfJWcUPSU3UuJz7PTGtsNqj72bDMga/jpX1QXBjolRN
gF/0Wo9rKbN2QHQZMn4F8ByVf9s2XReA4OkhLNI0VZeMSNuDdhlnmzbkuKuuWsme
WAuQnGOvYJNcwAf96EF0jUQ3+4VxhlUSkdy0zQCI2qEgRIziNyxnhQzo2ROJvmVm
Q1PXznNnc19/HpTCIpQNha8rNQPfl2QhU9pQ1zqxThnkOMQUc5hbcrzsyNOpfEPb
AcwyexVYjXfzB45sxldwZxbImn7WT9BTLzyGM8yMc0A+lC1POKWRMqwqXpPnb0KU
VXqFhl88leXRCarhCYOggIEEQzjio/cpXA0wnhtvQm/pfrqhrdNSdfpWe+f7O8V2
t6Kt7hAz3rxi/5Wg11HeGjK6BFujvHirQb73c42ScxbVRh2heriefD3TiGpwVyYf
iFadgTnAnNYA3wBjVIZxF7+w4leAgbwO9ypAlfhroQFoRBDefa/i6C9JE6ASaW3u
mskalv1GAhxpsQxt8Rt5
=cCsb
-----END PGP SIGNATURE-----

--Signature=_Wed__8_May_2013_10_11_54_+1000_=0NLpcgQz7.Pqml=--

--===============0092079454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0092079454==--
