From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: build failure after merge of the mac80211-next tree
Date: Wed, 24 Feb 2016 09:12:41 +0100
Message-ID: <1456301561.2050.2.camel@sipsolutions.net>
References: <20160224115927.3fa9161e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160224115927.3fa9161e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> [...]
> include/linux/bug.h:74:2: note: in expansion of macro
> 'BUILD_BUG_ON_MSG'
> =C2=A0 BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
> =C2=A0 ^
> net/rfkill/core.c:647:2: note: in expansion of macro 'BUILD_BUG_ON'
> =C2=A0 BUILD_BUG_ON(!rfkill_types[NUM_RFKILL_TYPES - 1]);
> =C2=A0 ^
>=20
> Caused by commit
>=20
> =C2=A0 1f86443b4ffe ("net: rfkill: add rfkill_find_type function")

Thanks for the heads-up.

> Maybe the compiler version matters?=C2=A0=C2=A0I am using gcc v5.2.0.

Hm. I'm using=C2=A0Debian 5.3.1-8.

> Though, it seems to be that "!rfkill_types[NUM_RFKILL_TYPES - 1]" is
> not a constant expression since
>=20
> static const char *rfkill_types[NUM_RFKILL_TYPES]
>=20
> does not stop "rfkill_types[NUM_RFKILL_TYPES - 1]" being modified at
> run time. I think that you might need:
>=20
> static const char * const rfkill_types[NUM_RFKILL_TYPES]

That's true, but since I can't test it I'll just solve this
differently. We'll never be able to insert anything into the middle, so
we can also just BUILD_BUG_ON() the ARRAY_SIZE() and do the code a bit
differently.

Thanks,
johannes
