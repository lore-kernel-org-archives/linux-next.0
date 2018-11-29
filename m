From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: linux-next: build warning after merge of the qcom tree
Date: Thu, 29 Nov 2018 08:30:48 -0800
Message-ID: <154350904879.88331.1156146258217230705@swboyd.mtv.corp.google.com>
References: <20181116101059.18ad3fc9@canb.auug.org.au>
 <20181129082540.4ceafca6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129082540.4ceafca6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2018-11-28 13:25:40)
> Hi all,
> =

> On Fri, 16 Nov 2018 10:10:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Hi all,
> > =

> > After merging the qcom tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> > =

> > drivers/gpu/drm/msm/adreno/a6xx_gmu.c: In function 'a6xx_gmu_rpmh_arc_v=
otes_init.constprop':
> > drivers/gpu/drm/msm/adreno/a6xx_gmu.c:943:12: warning: 'pri_count' is u=
sed uninitialized in this function [-Wuninitialized]
> >   pri_count >>=3D 1;
> >             ^~~
> > drivers/gpu/drm/msm/adreno/a6xx_gmu.c:948:12: warning: 'sec_count' may =
be used uninitialized in this function [-Wmaybe-uninitialized]
> >   sec_count >>=3D 1;
> >             ^~~
> > =

> > Introduced by commit
> > =

> >   ed3cafa79ea7 ("soc: qcom: cmd-db: Stop memcpy()ing in cmd_db_read_aux=
_data()")
> > =

> > # CONFIG_QCOM_COMMAND_DB is not set
> =

> I am still getting these warnings.
> =


Andy's email isn't at codeaurora.org anymore. Not sure if that matters
but he may be missing this.

Either way, thanks for the report. Fix coming shortly.
