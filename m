From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: linux-next: build warning after merge of the leds tree
Date: Tue, 19 Mar 2019 20:53:40 +0100
Message-ID: <33578161-eed4-3f19-5fcb-09e4b400dd18@gmail.com>
References: <20190319135833.64ad30b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319135833.64ad30b8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kangjie Lu <kjlu@umn.edu>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Thank you for the report.

On 3/19/19 3:58 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the leds tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/leds/leds-pca9532.c: In function 'pca9532_probe':
> drivers/leds/leds-pca9532.c:536:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>     devid = (int)of_id->data;
>             ^

Applied the fixup to the original commit, which missed to carry
the cast properly from the previous state of code.

-               devid = (int)of_id->data;
+               devid = (int)(uintptr_t) of_id->data;


> Introduced by commit
> 
>    6b788fae618c ("leds: fix a potential NULL pointer dereference")
> 

-- 
Best regards,
Jacek Anaszewski
