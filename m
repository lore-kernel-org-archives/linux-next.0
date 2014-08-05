From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm tree
Date: Tue, 5 Aug 2014 22:06:08 +1000
Message-ID: <20140805220608.427fc0d2@canb.auug.org.au>
References: <20140804180403.3cfdbadf@canb.auug.org.au>
	<53E0AB44.90804@imgtec.com>
	<20140805201342.6b8a8ca4@canb.auug.org.au>
	<53E0C27B.1020503@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AO963ujzf2Q.5tQaCTw+AqJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53E0C27B.1020503@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: James Hogan <james.hogan@imgtec.com>, Alexander Graf <agraf@suse.de>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>
List-Id: linux-next.vger.kernel.org

--Sig_/AO963ujzf2Q.5tQaCTw+AqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Tue, 05 Aug 2014 13:39:39 +0200 Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
>
> Il 05/08/2014 12:13, Stephen Rothwell ha scritto:
> >> > And I suppose it'd be nice to replace tabs with spaces for consisten=
cy
> >> > (since that's one of the things bf5590f37919 did).
> >> >=20
> >> > How about this fixup patch?
> > Thanks for that I have applied it to my merge resolution.
>=20
> I've now merged kvm-ppc and kvm-arm into kvm, so everything should be
> fixed tomorrow.  All conficts should be gone, and the build failure on
> PPC too.

Excellent, thanks

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/AO963ujzf2Q.5tQaCTw+AqJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJT4Mi1AAoJEMDTa8Ir7ZwVLoEP/Rt4RdUmwJYXPGtvXMNkMEhK
Xy4ORV/OVdk63cckl2R2wC5f+4NeIbZ+5z6KcjE96k9+NSE5cFow6JYINW/OgMKy
uO2tTMH41yYDMlx4+EhI0AjTINomF8p0F7wlQ0Ed/mrfPTlzDFbdUqXWLsMifCqC
1Gp1VcdyBRj2f/W4Ue6D+nipeBb6RUqgNENDsKGqCFweNFfRD1tTclBBJ0MTJnop
bwrMD2mxWsGXXvCN0NlmZFEo/mFYRjzkAQDStAkZS+6dmzmLlmKmv6lEpdwYKyPe
Z8NC2qLfzHPmHsZfvUbvT1MZKjLCTB3oBVovPLlSqDcc25LorF17WS+8kJx+4Euv
Gx7G5m3XFc0ImrfOcUMKtmkSaY3D8S3Bu8X8MiG06EMylXFRi6BLnm0viuPRCQRE
wdHTYG+u17TiF9WcXBZVPohAbZqhC7w0IWTaNjSmSf58uX3Y+j9jt3/FSprvUX0X
CU+6ySWutVTu7YqpmO1P0bv0bcG97LSBG7ksXX5L+Gprx6SZs5TNL5TW1EMEo5n7
3MhCljdeATxNjXcniveAIDs5vV3ZMZCX3MT7zbbxPK82ew+ExY6UOXKEKW9+JJBc
EKPdMbDu+eWsVM59VJWKTvdO0G+vFXZk0yVXW8uFQCq+tPTLzD5TM6xkyDu6iYH5
5Ti5yEDKrcr3CjzPIhm+
=5+zt
-----END PGP SIGNATURE-----

--Sig_/AO963ujzf2Q.5tQaCTw+AqJ--
