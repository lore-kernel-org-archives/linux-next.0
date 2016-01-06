From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Wed, 6 Jan 2016 12:54:53 -0500
Message-ID: <A83BAB8E-3923-46AE-8662-6846BF65F743@redhat.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au> <20160104124450.7ba21c87@canb.auug.org.au> <5689DEA0.1020803@redhat.com> <20160104193616.GB30315@fieldses.org> <24AC8112-95A2-4D7B-8048-3D7D50A78B90@oracle.com> <20160106121529.GA21780@lst.de> <568D0711.5020607@mellanox.com> <20160106122831.GA22044@lst.de>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: multipart/signed; boundary="Apple-Mail=_0C5B87FC-567A-4EAB-9C37-47E7531185E9"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160106122831.GA22044@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Or Gerlitz <ogerlitz@mellanox.com>, Chuck Lever <chuck.lever@oracle.com>, "J. Bruce Fields" <bfields@fieldses.org>, Doug Ledford <dledford@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>
List-Id: linux-next.vger.kernel.org


--Apple-Mail=_0C5B87FC-567A-4EAB-9C37-47E7531185E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 6, 2016, at 7:28 AM, Christoph Hellwig <hch@lst.de> wrote:
>=20
> On Wed, Jan 06, 2016 at 02:22:41PM +0200, Or Gerlitz wrote:
>> As I wrote here, the bits are already @ kernel.org
>>=20
>> git://git.kernel.org/pub/scm/linux/kernel/git/dledford/rdma.git =
k.o/for-4.5
>=20
> Ok, that's a little confusing.
>=20
> Doug, any chance you could settle on one tree? I don't really care
> which one.

I use both, but for different things.  For instance, when I had 9 out of =
10 of Sagi=E2=80=99s patches for iSER applied and was waiting on the =
10th patch to complete the set, I was willing to push that to my github =
tree so Sagi could check out how the first 9 had gone and double check =
my merge fixups while he rebased the 10th patch, but I didn=E2=80=99t =
want to push it to k.o.  I don=E2=80=99t rebase on k.o, ever (something =
Linus was adamant about when I started doing this).  But the github repo =
is released earlier and may be rebased.  If it is a smooth merge window, =
there is little, if any, difference between the two.  Only during merge =
windows when I am looking at different alternatives of controversial =
stuff does this seem to be an issue.

--Apple-Mail=_0C5B87FC-567A-4EAB-9C37-47E7531185E9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWjVTtAAoJELgmozMOVy/dkRUP/3/nZ1TmDP04CbwSCebZzDiv
+f+VOrauwFAufDWHq+AHJG+EkIXIei56Mb8JRSIBoCil6YPgzKXoN74gF+d71IvN
uqS40nFxmpi6oqKwmFiXRYIo5+TZou5KFHeODd71fcghxPVvK9m9/Sw4nezhnkH+
G1XRkxldKc4Kisy1GYclalZWh5Rn+o6WJe1VGT/YYQ4RayErJ75nwJhq9wI86/oQ
bWSx67qg6iMbFiAi0IqPRYR6hyRr53+Dpm5FiNhmAvImk1yTtAWfoQgvT29u7Btr
upiYo/FhoivibWJiZew5pUDkNT0zs/grwWISJB5IVNAI9nsWvi86hes43vGxnDDK
bcCJMc586+8y7fqFixg/cK6RN80fHoLIgRk2zJFIMWCeAiDOjqyaNh9jeraSsGON
GEEvySVaEUpcpWz6ECWB/ak4m+bUhSW8lX0eKmTHftkPLGglsYp8mCJ4f6relM4l
y7SjVdIoFkpxt+jpgYUe3mEsSPXxHTV4cbEk0nZOpuLTV30QTgF5rCLd+6j+sVrg
2G82F49d31THgXiG+OyGR0nIorR0wWCbsAY0i4AAjtDw7zkfbTO/3p6RzkuJCAPK
Un+Hx/dRFIYJuB41uPBD33nqImOs3WOnG4/+YGYfYLNWDOy7DWm5SDg8zSGWjnQ+
lPU+Rymhn3BooQdvsNDb
=6hpC
-----END PGP SIGNATURE-----

--Apple-Mail=_0C5B87FC-567A-4EAB-9C37-47E7531185E9--
