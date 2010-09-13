From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Add mmc tree to linux-next
Date: Mon, 13 Sep 2010 10:38:01 +1000
Message-ID: <20100913103801.f37f445b.sfr@canb.auug.org.au>
References: <m38w392xx5.fsf@pullcord.laptop.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__13_Sep_2010_10_38_01_+1000_aPWcX+NAZfOcb7LA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43189 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753666Ab0IMAiJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Sep 2010 20:38:09 -0400
In-Reply-To: <m38w392xx5.fsf@pullcord.laptop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Ball <cjb@laptop.org>
Cc: linux-next@vger.kernel.org, Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>

--Signature=_Mon__13_Sep_2010_10_38_01_+1000_aPWcX+NAZfOcb7LA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chris,

On Fri, 10 Sep 2010 15:36:38 -0400 Chris Ball <cjb@laptop.org> wrote:
>
> Please add the new MMC tree to linux-next:
>=20
> mmc             git     git://git.kernel.org/pub/scm/linux/kernel/git/cjb=
/mmc.git#mmc-next

I have added this from today.  I note that there appears to be some
(unrelated) kvm commits at the start of this tree ...

Avi Kivity (2):
      KVM: x86 emulator: fix regression with cmpxchg8b on i386 hosts
      KVM: fix i8259 oops when no vcpus are online

Gleb Natapov (1):
      KVM: i8259: fix migration

Zachary Amsden (1):
      KVM: x86: Perform hardware_enable in CPU_STARTING callback

> Thanks!  I'm interested in setting up automated testing on real
> hardware for MMC, so I'd like to chat about options for live testing
> of -next at some point.  It looks like test.kernel.org hasn't updated
> since 2.6.34.  :/

I don't have anything to do with test.kernel.org, sorry.  My build test
results are reported here: http://kisskb.ellerman.id.au/linux-next

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Mon__13_Sep_2010_10_38_01_+1000_aPWcX+NAZfOcb7LA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMjXJpAAoJEDMEi1NhKgbs9rIH/RwRsZmqH4HBVfAjX/BzAeFM
V/GXuYKOKg53+Ocb0iJAPN7pppd9c3WUZxc9yNIv4bf7JoNqlaoVyauf5VTBNjdP
7WIw+u4u+oaC2Xg4wIfvT3eaJIAnueOjKJlbKfKV3BFa0Y4pzfycw0JGjFa29RNG
rgZwv0gilKcqihtKGSAit180cwXLjnAZcLNhMYrqczz0BMvxsaO05q7FqD2CV61s
cFDuhXBBFOklVr9DbLfd/LTwNYN5Ytz385O4KrCJmMTh9qOST2P4HjhjmdEASbiu
22QPHWtCrqyV8Ll7ZjRCtFstH/I0A2N1CW8YXmkLA/X6FubDjiu7aMtFYF+eJfQ=
=L5+Z
-----END PGP SIGNATURE-----

--Signature=_Mon__13_Sep_2010_10_38_01_+1000_aPWcX+NAZfOcb7LA--
