From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build warning after merge of the cgroup tree
Date: Fri, 15 Dec 2017 05:10:32 -0800
Message-ID: <20171215131032.GD3919388@devbig577.frc2.facebook.com>
References: <20171213145627.656e3909@canb.auug.org.au>
 <CAK8P3a1v59UJ1XhgGELZbFNDyv0SNm2hM2Tghnq4+4Own57CBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a1v59UJ1XhgGELZbFNDyv0SNm2hM2Tghnq4+4Own57CBA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ma Shimiao <mashimiao.fnst@cn.fujitsu.com>
List-Id: linux-next.vger.kernel.org

On Fri, Dec 15, 2017 at 10:58:04AM +0100, Arnd Bergmann wrote:
> As long as cft->name is guaranteed to be NUL-terminated, using strlcpy() would
> work just as well and avoid that warning, so the change below could be folded
> into that commit.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to cgroup/for-4.15-fixes.  Sorry about not responding sooner.

Thanks.

-- 
tejun
