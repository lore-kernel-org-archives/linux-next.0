From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Date: Wed, 24 Sep 2014 12:05:12 +0200
Message-ID: <54229758.5060109@redhat.com>
References: <20140922140645.7c2ad9c8@canb.auug.org.au> <20140924165030.41c90baf@canb.auug.org.au> <20140924070612.GA15794@cbox>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62028 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751620AbaIXKFg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Sep 2014 06:05:36 -0400
In-Reply-To: <20140924070612.GA15794@cbox>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marc Zyngier <marc.zyngier@arm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Auger <eric.auger@linaro.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Il 24/09/2014 09:06, Christoffer Dall ha scritto:
>>> Still getting this failure.
>>> 
> Commit e9142e3b69c2ae8a699463e219e5b029ff0d652b in kvm/queue fixes
> this, but it hasn't gone to next yet.
> 
> Paolo, I know there's a scary commit in queue but there's a bunch
> of scary stuff in the kvmarm/next too that I'd like to see in next,
> any chance you can put a subset of queue into next?

Yes, I will put the commit in next and rebase queue on top of it.

Paolo
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUIpdYAAoJEBvWZb6bTYbyAkwP/jwno7pOt/sHUaa+p45Uouse
oFS2aej8ZVLz3LMy6KjFuIME1bJjQytIZrFaGn+UksGd6cfhECydVO8hlJxWUDbc
PrWpnwzX/u4sorewmX+hq9EoFBfIEzC86NyrUaujiL6ojLjoJ4mkoRc9LRCm/K7j
dPJFGEQqifs0HelWSQPxH4ei/YyHk/TcaKgepQGlG4Aw/crLHmEajbrnGLge7isW
H/EtBW5iJToG8mxB+ipSwFCADUkXC+FUrEblX5Nxma/949roXg8LPuZUBxCxWwyr
Voi5/lU1sZMRYixoCHhhKaWPDfoSspjPU4JNEUMj4qtrZrBD9W27+bjyQBTdLjU7
erI1pQCmZsU52RdAtZiUBuSbRxb8is+WlRHJy7dhlb+SBcgXNWw/k9sxV2U6PZ+T
Z4A0ngZM12ZTd6XWgiE+3mMR0XGBsjh7TYq+ybQReCgKeNy/Q3FL6fS4E9me7MWF
CWIfqV327GYfH/eU8Bd1/VHGEZfDefDXZrdANa+A5FhaGTLIZbPHfEo2BCc85LhS
RRlKjIg1LeByCHDRaQ8parl0xgZRLuENfHn5gso4ZsAKgLyUp8IIGanxH8GD2sRO
F2AtAFfLSlXUo/FsxaW0bQOxnBB9L/UX5QmMT/YwG7QoP97Wa4fDBV1ruHTiJ9SO
s/nkZE3pcbAFSv/0rXlG
=ln4T
-----END PGP SIGNATURE-----
