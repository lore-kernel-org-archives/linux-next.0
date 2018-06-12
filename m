From: dvhart@infradead.org
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Mon, 11 Jun 2018 20:28:01 -0700
Message-ID: <775DC8EC-94B1-4A6C-B799-4E0156F5BE41@infradead.org>
References: <20180612112310.2d77e1c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612112310.2d77e1c3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-next.vger.kernel.org



On June 11, 2018 6:23:10 PM PDT, Stephen Rothwell <sfr@canb=2Eauug=2Eorg=
=2Eau> wrote:
>Hi all,
>
>After merging the drivers-x86 tree, today's linux-next build (x86_64
>allmodconfig) failed like this:
>
>drivers/platform/x86/silead_dmi=2Ec:84:21: error: variable
>'chuwi_vi10_data' has initializer but incomplete type
> static const struct ts_dmi_data chuwi_vi10_data =3D {
>                     ^~~~~~~~~~~
=2E=2E=2E
>Caused by commit
>
>2da502a0aea7 ("platform/x86: silead_dmi: Add touchscreen info for the
>Chuwi Vi10 tablet")
>
>I have reverted that commit for today=2E  More care please=2E

Grmbl=2E Thanks Stephen=2E I'll work with Andy tonight to get for-next bac=
k into good shape=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
