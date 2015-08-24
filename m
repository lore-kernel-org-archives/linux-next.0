From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Mon, 24 Aug 2015 10:48:07 -0400
Message-ID: <E3363999-BB62-445A-9077-BAFF3BA80A10@linuxhacker.ru>
References: <20150818105634.5be18a1c@canb.auug.org.au> <20150824091607.4e07c55a@canb.auug.org.au> <CAABAsM7qcdKA4FsQwa7kDcWSpMSq-SXt2fXo71Wr+0i5eKfHVA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAABAsM7qcdKA4FsQwa7kDcWSpMSq-SXt2fXo71Wr+0i5eKfHVA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <Anna.Schumaker@netapp.com>, Amir Shehata <amir.shehata@intel.com>
List-Id: linux-next.vger.kernel.org

Hello!

On Aug 24, 2015, at 10:17 AM, Trond Myklebust wrote:

> Hi Stephen,
> 
> On Sun, Aug 23, 2015 at 7:16 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Trond,
>> 
>> On Tue, 18 Aug 2015 10:56:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>> 
>>> After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
>>> failed like this:
>>> 
>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_pmr_pool_map':
>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:2: error: implicit declaration of function 'ib_reg_phys_mr' [-Werror=implicit-function-declaration]
>>>  pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
>>>  ^
>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:1828:14: warning: assignment makes pointer from integer without a cast
>>>  pmr->pmr_mr = ib_reg_phys_mr(hdev->ibh_pd,
>>>              ^
>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c: In function 'kiblnd_hdev_setup_mrs':
>>> drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.c:2380:6: warning: assignment makes pointer from integer without a cast
>>>   mr = ib_reg_phys_mr(hdev->ibh_pd, &ipb, 1, acflags, &iova);
>>>      ^
>>> 
>>> Caused by commit
>>> 
>>>  1241d7bf2ac8 ("core: Remove the ib_reg_phys_mr() and ib_rereg_phys_mr() verbs")
>>> 
>>> which noted this build failure would occur :-(
>>> 
>>> Since this commit is self comtained, I have reverted it until someone
>>> provides a fix for the lustre code.
>> 
>> Any chance of you including the below patch into the nfs tree to fix
>> the allmodfig build?  Currently, I have to disable lustre in the nfs
>> tree merge and then reenable it in the staging tree merge - which shows
>> that this patch (which is also in the staging tree) fixes the build
>> problem.  Without this patch (or a patch that disables lustre), if the
>> nfs tree is merged by Linus before the staging tree, his allmodconfig
>> build will break.
>> 
>> (Greg's SOB line is there because he has also included this patch in
>> the staging tree.)
> 
> If Oleg is OK with this, then I can certainly try.

I am sure fine with that.

Thanks

Bye,
    Oleg