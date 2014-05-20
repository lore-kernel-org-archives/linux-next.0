From: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: linux-next: manual merge of the dma-buf tree with the staging tree
Date: Tue, 20 May 2014 13:34:19 +0530
Message-ID: <CAO_48GGLfTKh0nFfCAMi_bqi4u=_ycrwYS_NfqiAfd+g5ah9_g@mail.gmail.com>
References: <20140520170031.1d27c26a@canb.auug.org.au> <20140520070605.GA7961@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:56212 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752554AbaETIEl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 May 2014 04:04:41 -0400
Received: by mail-oa0-f48.google.com with SMTP id i4so104435oah.21
        for <linux-next@vger.kernel.org>; Tue, 20 May 2014 01:04:41 -0700 (PDT)
In-Reply-To: <20140520070605.GA7961@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maarten Lankhorst <maarten.lankhorst@canonical.com>, Seunghun Lee <waydi1@gmail.com>

On 20 May 2014 12:36, Greg KH <greg@kroah.com> wrote:
> On Tue, May 20, 2014 at 05:00:31PM +1000, Stephen Rothwell wrote:
>> Hi Sumit,
>>
>> Today's linux-next merge of the dma-buf tree got a conflict in
>> drivers/staging/android/sync.c between commit 10f62861b4a2 ("staging:
>> android: fix missing a blank line after declarations") from the staging
>> tree and commit 85958aff6184 ("android: convert sync to fence api, v5")
>> from the dma-buf tree.
>>
>> I fixed it up (I just used the dma-buf tree version of conflicting
>> sections) and can carry the fix as necessary (no action is required).
>
> Sounds good, thanks.
>
> greg k-h

Sure Stephen,

Sounds good! Thanks.

Sumit
