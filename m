From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the mediatek tree
Date: Mon, 14 May 2018 12:47:48 +0200
Message-ID: <01b4e66c-8c1d-1ea7-d35e-3555a3c3eeb0@gmail.com>
References: <20180514075745.168494a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514075745.168494a9@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Stephen,

On 05/13/2018 11:57 PM, Stephen Rothwell wrote:
> Hi Matthias,
> 
> Commit
> 
> f039c4193c93 ("iregmap: include <linux/ktime.h> from
> include/linux/regmap.h")
> 
> is missing a Signed-off-by from its committer.
> 

My tree was broken and the merge commit disappeared which pulled this commit
into my tree. Should be fixed by now.

Regards,
Matthias
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiUuSfQSYnG8EMsBltDliWyzx00MFAlr5aU0ACgkQtDliWyzx
00O68Q//eXk6z6PiRXG+30Pk5z5Wl3vmEvEokwivO1I1kCErktyAcvjMNYA5CJS+
Df7FWAg3p17G7e6p7w5NOteOxBI4leCsebLnRMKOja2m6IrulxHb98koAjcx14sx
twKsa2YEMI7GjhwE93ozkoqkeGeQ0i/IxyFRqn0brcpmUv/49AY8Qw4VTi/Q5rxm
ma6YFWygcQ7x603eWrkxJKG5pmExmUTwNU7B+9Ycqp/yMaikUYW9RedToDxjILAJ
OGQ2uexySNyUJaX2ECpHeM7FnSkOBKzqAjzCD8bDQTL82hiUla5mDFRsOhtzg9be
pe/CdChbeLxZ0v8fv1n2WEO4Bb1E6OXp7YmL8hH6nbmWVxQf448QX0POV5IrJX+V
46/iMzwUtjTasAj50RoI8cb3mhj0fcJgmB/Ivk6OZQfy1UoZ0VrPjIiNlymfgTGM
aP28Dx8RUxysZCvj0Uy/CX+kxMxJU77OgOMDxotf8iTAVnbC2dSqiHSkqZCj7ncK
1cVQkfUHvqEgtCdsEyHN+k7fcu2vmYwvISE5IpoKZyHPU1CNc5+cFdEbxlCvUVVJ
K9PNYz8VFJsYJyYcVG+1C4EUJHLRrnhTK6cdp5GaKlSHagV8UKaefuUvXU8GRBZm
BO+xTm6qRX5ZnQI57MPaq/xEvhVevMRG4xp0wZ5Bf86uIvlP97w=
=gxCq
-----END PGP SIGNATURE-----
