From: Daniel Hellstrom <daniel@gaisler.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Wed, 13 Mar 2013 12:20:09 +0100
Message-ID: <514060E9.2030208@gaisler.com>
References: <20130312153047.dc10eb2392d07af8822e45f1@canb.auug.org.au> <513EF5DD.2010501@gaisler.com> <20130312225719.c70d478eff3e77633d029386@canb.auug.org.au> <20130312161302.GA12317@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130312161302.GA12317@core.coreip.homeip.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 03/12/2013 05:13 PM, Dmitry Torokhov wrote:
> On Tue, Mar 12, 2013 at 10:57:19PM +1100, Stephen Rothwell wrote:
>> On Tue, 12 Mar 2013 10:31:09 +0100 Daniel Hellstrom <daniel@gaisler.com> wrote:
>>> APBPS2 driver is missing linux/slab.h required on at least PowerPC. See patch below. How do you want me to proceed?
>> That is up to Dmitry - either a fix up patch (with SoB and commit
>> message) or a replacement patch.
> I fixed up the commit and refreshed the branch.
>
> Thanks.

Thanks,
Daniel
