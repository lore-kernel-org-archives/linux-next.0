From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: manual merge of the phy-next tree with Linus' tree
Date: Wed, 12 Dec 2018 10:58:38 +0530
Message-ID: <470d74f1-2778-db77-641e-97310335ac42@ti.com>
References: <20181212151647.71a5befe@canb.auug.org.au>
 <c868398c-9410-fa2d-26f4-dd86102a3584@ti.com>
 <20181212161217.6858c3d9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212161217.6858c3d9@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi,

On 12/12/18 10:42 AM, Stephen Rothwell wrote:
> Hi Kishon,
> 
> On Wed, 12 Dec 2018 10:37:37 +0530 Kishon Vijay Abraham I <kishon@ti.com> wrote:
>>
>> I've rebased by 'next' branch on top of my 'fixes' branch to avoid this conflict.
> 
> Why didn't you just merge them?

Merging will create a new merge commit which I can avoid by rebasing. Also the
patches in next branch will be above the patches in fixes branch.

Thanks
Kishon
> 
