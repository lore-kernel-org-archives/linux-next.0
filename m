From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the xfs tree
Date: Fri, 1 Jun 2018 20:37:59 -0700
Message-ID: <CAPcyv4gTcVL0cWy_uB3MRa4BH+4Tz8uoCvkqBxt-BxxFkWOUdw@mail.gmail.com>
References: <20180601185846.1c5b7d0a@canb.auug.org.au> <20180602005948.GH7825@magnolia>
 <20180602113312.55667641@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180602113312.55667641@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, David Chinner <david@fromorbit.com>, linux-xfs <linux-xfs@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 1, 2018 at 6:33 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Darrick,
>
> On Fri, 1 Jun 2018 17:59:48 -0700 "Darrick J. Wong" <darrick.wong@oracle.com> wrote:
>>
>> > +   if (!dax_enabled) {
>> >  -          pr_debug("VFS (%s): error: dax support not enabled\n",
>> >  -                          sb->s_id);
>> >  +          pr_debug("%s: error: dax support not enabled\n",
>> >  +                          bdevname(bdev, buf));
>> > -           return false;
>> > +           return -EOPNOTSUPP;
>>
>> Hang on a sec, the changes in the xfs tree make this function return a
>> boolean (true for dax-is-supported, false for dax-not-supported), but
>> this change partially reverts the boolean return values.
>
> OK, weird, that is what I though I had done.  Thanks for pointing it
> out (I guess it was getting late :-().
>
>> >     }
>> > -
>> > -   return true;
>> > +   return 0;

Good catch Darrick, I missed that too...
