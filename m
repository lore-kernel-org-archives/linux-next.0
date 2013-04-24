From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: linux-next: build failure after merge of the final tree
 (staging tree related))
Date: Wed, 24 Apr 2013 13:33:42 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F0021D451A3BE8@AUSP01VMBX24.collaborationhost.net>
References: <20130424175600.df4a7e5307ea813e3afe73ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130424175600.df4a7e5307ea813e3afe73ea@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wednesday, April 24, 2013 12:56 AM, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/staging/comedi/drivers/ni_labpc.c: In function 'labpc_ai_cmd':
> drivers/staging/comedi/drivers/ni_labpc.c:980:9: error: implicit declaration of function 'virt_to_bus' [-Werror=implicit-function-declaration]
>

Stephen,

I just posted a patch that hopefully will fix this.

Please let me know if it works.

Regards,
Hartley
