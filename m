From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH] drivers/media: fix dependencies in video mt9t001/mt9p031
Date: Sat, 08 Oct 2011 07:52:57 -0300
Message-ID: <4E902B89.7030004@redhat.com>
References: <4E83A02F.2020309@xenotime.net> <1317418491-26513-1-git-send-email-paul.gortmaker@windriver.com> <4E8644D5.6080307@xenotime.net> <20111006140214.b64b22b77f2f831442d59794@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20111006140214.b64b22b77f2f831442d59794@canb.auug.org.au>
Sender: linux-media-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Em 06-10-2011 00:02, Stephen Rothwell escreveu:
> Hi Mauro,
>
> On Fri, 30 Sep 2011 15:38:13 -0700 Randy Dunlap<rdunlap@xenotime.net>=
  wrote:
>>
>> On 09/30/11 14:34, Paul Gortmaker wrote:
>>> Both mt9t001.c and mt9p031.c have two identical issues, those
>>> being that they will need module.h inclusion for the upcoming
>>> cleanup going on there, and that their dependencies don't limit
>>> selection of configs that will fail to compile as follows:
>>>
>>> drivers/media/video/mt9p031.c:457: error: implicit declaration of f=
unction =E2=80=98v4l2_subdev_get_try_crop=E2=80=99
>>> drivers/media/video/mt9t001.c:787: error: =E2=80=98struct v4l2_subd=
ev=E2=80=99 has no member named =E2=80=98entity=E2=80=99
>>>
>>> The related config options are CONFIG_MEDIA_CONTROLLER and
>>> CONFIG_VIDEO_V4L2_SUBDEV_API.  Looking at the code, it appears
>>> that the driver was never intended to work without these enabled,
>>> so add a dependency on CONFIG_VIDEO_V4L2_SUBDEV_API, which in
>>> turn already has a dependency on CONFIG_MEDIA_CONTROLLER.
>>>
>>> Reported-by: Randy Dunlap<rdunlap@xenotime.net>
>>> Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
>>
>> Acked-by: Randy Dunlap<rdunlap@xenotime.net>
>
> Ping?
>
Sorry, I was assuming that this patch would be going together with the
other module.h trees. I'll apply it on my tree.

Thanks,
Mauro
