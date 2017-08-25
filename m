From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sound-asoc tree with the
 sound-current tree
Date: Fri, 25 Aug 2017 21:02:42 +1000
Message-ID: <20170825210242.44de4405@canb.auug.org.au>
References: <20170825125705.44de0444@canb.auug.org.au>
        <1503653849.25945.96.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503653849.25945.96.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tom Rini <trini@konsulko.com>
List-Id: linux-next.vger.kernel.org

Hi Andy,

On Fri, 25 Aug 2017 12:37:29 +0300 Andy Shevchenko <andriy.shevchenko@linux=
.intel.com> wrote:
>
> This one AFAIU is a quick fix solely for v4.13.
>=20
> Thus, the correct fix is to remove all 3 IDs from that table to get:
>=20
> =C2=A0static const struct i2c_device_id rt5677_i2c_id[] =3D {
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rt5677_i2c_id);
>=20
> at the end.

Thanks, I have fixed that up for Monday.

--=20
Cheers,
Stephen Rothwell
