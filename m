From: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 20 May 2015 09:01:14 +0300
Message-ID: <CAFCwf10NJNcivdX92_5Jk-fHOJ1L-VAEq=hfEh+1b2nSuK3D3A@mail.gmail.com>
References: <20150520130828.4fdacf54@canb.auug.org.au> <alpine.DEB.2.00.1505200541090.3204@skynet.skynet.ie>
 <20150520152538.15e7a1cc@canb.auug.org.au> <20150520153102.3e70a45c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:36362 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751524AbbETGBp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 02:01:45 -0400
In-Reply-To: <20150520153102.3e70a45c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>

On Wed, May 20, 2015 at 8:31 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dave,
>
> On Wed, 20 May 2015 15:25:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Wed, 20 May 2015 05:41:46 +0100 (IST) Dave Airlie <airlied@linux.ie> wrote:
>> >
>> > > After merging the drm tree, today's linux-next build (powerpc
>> > > ppc64_defconfig) failed like this:
>> > >
>> > > drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c: In function 'create_queue_cpsch':
>> > > drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c:888:2: error: implicit declaration of function 'init_sdma_vm' [-Werror=implicit-function-declaration]
>> > >   init_sdma_vm(dqm, q, qpd);
>> > >   ^
>> > >
>> > > Caused by commit 3e3f6e1a90a8 ("drm/amdkfd: make the sdma vm init to be
>> > > asic specific").
>> > >
>> > > I have used the drm tree from next-20150519 for today.
>> >
>> > Okay this looks like a silent conflict, I'll have to pull Linus tree into
>> > drm-next and fix it up there.
>>
>> Yep, against commit 79b066bd76d5 ("drm/amdkfd: Initialize sdma vm when
>> creating sdma queue") which is in v4.1-rc3.
>
> So you could, of course, just merge that commit instead of Linus'
> tree ...
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

Hi,
Did I need to do something different in order to prevent this conflict ?
Do some manual merge before sending the pull request ?

Thanks,
          Oded
