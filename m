From: "Myklebust, Trond" <Trond.Myklebust@netapp.com>
Subject: RE: linux-next: build failure after merge of the nfs tree
Date: Tue, 2 Oct 2012 01:08:09 +0000
Message-ID: <4FA345DA4F4AE44899BD2B03EEEC2FA908FFCB41@SACEXCMBX04-PRD.hq.netapp.com>
References: <20121002103907.e43f5bb1cc9e6b85b3a51ef8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121002103907.e43f5bb1cc9e6b85b3a51ef8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Stephen Rothwell
> Sent: Monday, October 01, 2012 8:39 PM
> To: Trond Myklebust
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: linux-next: build failure after merge of the nfs tree
> 
> Hi Trond,
> 
> After merging the nfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/nfs/callback.c: In function 'nfs_minorversion_callback_svc_setup':
> fs/nfs/callback.c:206:21: error: 'ENOTSUP' undeclared (first use in this
> function)
> 
> Caused by commit 141e1f553b6e ("NFSv4: Fix the minor version callback
> channel startup").
> 

Hi Stephen,

Thanks! We've already fixed this issue and pushed out a new tree...

Cheers
  Trond
