From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure in drivers/mfd/aat2870-core.c
Date: Fri, 30 Sep 2011 11:46:33 -0400
Message-ID: <4E85E459.9020306@windriver.com>
References: <4E839B53.3010201@windriver.com> <D9A2FA38A1E15B4E832469E5FE40C7ABFA07D3E667@HKMAIL01.nvidia.com> <CAMfhKb9dTY_OemQAgJokHn=DzaHn2hpi8UHRGvtFOv7a0SEjkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:50747 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab1I3Pqf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2011 11:46:35 -0400
In-Reply-To: <CAMfhKb9dTY_OemQAgJokHn=DzaHn2hpi8UHRGvtFOv7a0SEjkg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jin Park <jinyoungp@nvidia.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org

On 11-09-30 07:47 AM, Jin Park wrote:
> Hi, Paul
> 
> I have checked aat2870-core.c build problem when x86_64 and got the
> same error with you.
> 
> This error occurred since merged below change.
> ----------------------------------------------------------------------------------
> commit da417bacc9143b934f1a480a25d0fb2bb648a820
> Author: Stephen Boyd <sboyd@codeaurora.org>
> Date:   Wed Sep 28 10:50:29 2011 +1000
> 
>     x86: implement strict user copy checks for x86_64
> ----------------------------------------------------------------------------------
> The above change is check object size and copy size for
> copy_from_user() to prevent overflow.
> 
> The root cause is not matched type of size parameter for
> copy_from_user() in aat2870-core.c for x86_64.
> Because I just passed int type for size parameter to copy_from_user().
> It has no problem for i386, but has problem for x86_64.
> 
> 
> This is the patch for this build problem. Please review it.

You've got good information above about how you discovered the
root cause and which pending commit triggers the issue, but then
the commit below only has a minimal shortlog and no additional
information whatsoever.  I'd suggest capturing your information
in the commit's long log, so it is there for everyone, and not
just available to the people who happen to read this thread.

Thanks,
Paul.

> 
> mfd: aat2870: Fix build failure for x86_64
> 
> Signed-off-by: Jin Park <jinyoungp@nvidia.com>
> ---
>  drivers/mfd/aat2870-core.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mfd/aat2870-core.c b/drivers/mfd/aat2870-core.c
> index 345dc65..02c4201 100644
> --- a/drivers/mfd/aat2870-core.c
> +++ b/drivers/mfd/aat2870-core.c
> @@ -295,7 +295,7 @@ static ssize_t aat2870_reg_write_file(struct file *file,
>  {
>  	struct aat2870_data *aat2870 = file->private_data;
>  	char buf[32];
> -	int buf_size;
> +	ssize_t buf_size;
>  	char *start = buf;
>  	unsigned long addr, val;
>  	int ret;
