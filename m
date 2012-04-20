From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: triage for April 18, 2012
Date: Thu, 19 Apr 2012 20:21:15 -0400
Message-ID: <CAP=VYLpQ7zMReYn-6OoZUnok7dGKS5C+Fdb2BU2FHZTM5wvpBg@mail.gmail.com>
References: <20120419020136.GB3443@windriver.com> <878vhrjs6x.fsf@laptop.org> <Pine.LNX.4.64.1204200023500.2110@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1204200023500.2110@axis700.grange>
Sender: linux-kernel-owner@vger.kernel.org
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Chris Ball <cjb@laptop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, Apr 19, 2012 at 6:24 PM, Guennadi Liakhovetski
<g.liakhovetski@gmx.de> wrote:
> On Thu, 19 Apr 2012, Chris Ball wrote:
>
>> Hi,
>>
>> On Wed, Apr 18 2012, Paul Gortmaker wrote:
>> > ARM:mackerel_defconfig,ag5evm_defconfig
>> > =A0 =A0 when: =A0 Apr 19 (possibly earlier?)
>> > =A0 =A0 why: =A0 =A0pfc-sh7372.c: undefined reference to `mmc_dete=
ct_change'
>> > =A0 =A0 why: =A0 =A0pfc-sh73a0.c: undefined reference to `mmc_dete=
ct_change'
>> > =A0 =A0 status:
>> > =A0 =A0 fix:
>> > =A0 =A0 ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildresul=
t/6131930/
>> > =A0 =A0 ref: =A0 =A0http://kisskb.ellerman.id.au/kisskb/buildresul=
t/6131908/
>>
>> Adding Guennadi and Magnus to CC for this error (which is coming fro=
m
>> tmio_mmc_cd_wakeup).
>
> ...waiting for these patches to make it in:

Thanks for the update, I'll add those links while we are waiting.

P.

>
> http://article.gmane.org/gmane.linux.ports.sh.devel/14412
> http://article.gmane.org/gmane.linux.ports.sh.devel/14413
>
> Thanks
> Guennadi
> ---
> Guennadi Liakhovetski, Ph.D.
> Freelance Open-Source Software Developer
> http://www.open-technology.de/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
