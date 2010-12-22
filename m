From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/radeon: Remove DRIVER_DATE for UMS and KMS
Date: Wed, 22 Dec 2010 08:55:39 +0100
Message-ID: <1293004539.19556.70.camel@thor.local>
References: <AANLkTik7SQ76zcAMk5=mgKRF7MWghVHhLtY1CtK-WPKy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTik7SQ76zcAMk5=mgKRF7MWghVHhLtY1CtK-WPKy@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sedat.dilek@gmail.com
Cc: Dave Airlie <airlied@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

On Mit, 2010-12-22 at 08:38 +0100, Sedat Dilek wrote:=20
>=20
> sorry, I still haven't setup a git-send-mail, thus sending the
> old-fashioned way as attached patch.

Your mailer might allow integrating the output of git format-patch into
the mail body directly instead.

> This patch (against linux-next) is overdue.
>=20
> "DRIVER_DATE is not maintained or upgraded on changes.
>=20
> Furthermore, one DRIVER_DATE for UMS and KMS makes no sense.
> It is enough to bump {KMS_}DRIVER_MAJOR, {KMS_}DRIVER_MINOR and
> {KMS_}DRIVER_PATCHLEVEL defines."

What ends up being printed as the date in dmesg?


--=20
Earthling Michel D=C3=A4nzer           |                http://www.vmwa=
re.com
Libre software enthusiast         |          Debian, X and DRI develope=
r
