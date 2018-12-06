From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: bad merge in the y2038 tree
Date: Thu, 6 Dec 2018 23:09:01 +0100
Message-ID: <CAK8P3a1U9y7rHq9GUd-BrY4=aLLyBYZLm8X0JcKU6j2_sYCCmQ@mail.gmail.com>
References: <20181207071147.3b41fb5c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207071147.3b41fb5c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 6, 2018 at 9:12 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Arnd,
>
> The y2038 tree contains a merge of next-20181206.  I cannot use a tree
> that includes a version of linux-next.  I assume that this was just a
> test merge, so please remove it.

Fixed now, I had pushed the wrong branch after I had done the test build to
make sure that it wouldn't conflict with anything in yesterday's linux-next.

Sorry about that.

        Arnd
