From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: linux-next: build failure after merge of the i2c tree
Date: Fri, 16 Jan 2015 09:16:33 +0200
Message-ID: <A7E15511-DF00-40D4-91CC-660038F5A71F@konsulko.com>
References: <20150116132253.1c5f7a8d@canb.auug.org.au>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150116132253.1c5f7a8d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> On Jan 16, 2015, at 04:22 , Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Hi Wolfram,
>=20
> After merging the i2c tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/i2c/i2c-core.c: In function 'i2c_unregister_device':
> drivers/i2c/i2c-core.c:1016:3: error: implicit declaration of functio=
n 'of_node_clear_flag' [-Werror=3Dimplicit-function-declaration]
>   of_node_clear_flag(client->dev.of_node, OF_POPULATED);
>   ^
> drivers/i2c/i2c-core.c:1016:43: error: 'OF_POPULATED' undeclared (fir=
st use in this function)
>   of_node_clear_flag(client->dev.of_node, OF_POPULATED);
>                                           ^
>=20
> Caused by commit d5285c36e6d2 ("i2c: Mark instantiated device nodes
> with OF_POPULATE").
>=20
> I have used the version of the i2c tree from next-20150115 for today.

A patch that fixes it has already been posted.

> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20

Regards

=E2=80=94 Pantelis
