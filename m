From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 30 Jun 2017 10:42:25 +0530
Message-ID: <d0b99e22-b379-22fa-aaab-d712c54354e0@gmail.com>
References: <20170630140054.38f98968@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170630140054.38f98968@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,
      I have push one more patch which does not have this warning.
please avoid my first patch.

Thanks
~ arvind

On Friday 30 June 2017 09:30 AM, Stephen Rothwell wrote:
> Hi Darren,
>
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/platform/x86/sony-laptop.c: In function 'sony_laptop_setup_input':
> drivers/platform/x86/sony-laptop.c:494:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-array-qualifiers]
>    key_dev->keycode = &sony_laptop_input_keycode_map;
>                     ^
>
> Introduced by commit
>
>    a0f0a5e1978b ("platform/x86: sony-laptop: constify few static structures")
>
