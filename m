From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: Tree for Aug 28
Date: Fri, 28 Aug 2015 12:06:46 -0700
Message-ID: <CAPcyv4iWFGKOLd0KJQRBR9_bG1czoiA_edpoeS5WXtWf_SD9XA@mail.gmail.com>
References: <20150828182712.3d45a033@canb.auug.org.au>
	<20150828152441.GA8179@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150828152441.GA8179@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 28, 2015 at 8:24 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Aug 28, 2015 at 06:27:12PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150827:
>>
>> The rdma tree gained a conflict aaginst the net-next tree.
>>
>> The sound-asoc tree gained a build failure for which I reverted a commit.
>>
>> The mmc-uh tree lost its build failure.
>>
>> The tty tree still had its build failure for which I reverted part of
>> a commit.
>>
>> The nvdimm tree gained conflicts against Linus' and the v4l-dvb trees.
>>
>> Non-merge commits (relative to Linus' tree): 10211
>>  8743 files changed, 533186 insertions(+), 210999 deletions(-)
>>
>> ----------------------------------------------------------------------------
>>
>
> Time for a status report. We might see at least some of the following
> failures in mainline after the commit window closes.
>
> Build results:
>         total: 145 pass: 138 fail: 7
> Failed builds:
>         alpha:allmodconfig [1], [2]

Thanks for the report!  Fixed and pushed back out to the
libnvdimm-for-next branch of nvdimm.git
