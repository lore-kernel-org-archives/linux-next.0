From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v2 0/2] drm/radeon: use NULL instead of zero
Date: Tue, 6 May 2014 16:28:52 +0000
Message-ID: <A3397C8B8B789E45844E7EC5DEAD89D040EEFF95@satlexdag05.amd.com>
References: <20140503135512.GA17068@ativ>
 <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
 <20140505202631.GA404@ativ>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bl2lp0207.outbound.protection.outlook.com ([207.46.163.207]:50395
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750810AbaEFQ3Q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 May 2014 12:29:16 -0400
In-Reply-To: <20140505202631.GA404@ativ>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michele CURTI <michele.curti@gmail.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

> -----Original Message-----
> From: Michele CURTI [mailto:michele.curti@gmail.com]
> Sent: Monday, May 05, 2014 4:27 PM
> To: Deucher, Alexander
> Cc: Koenig, Christian; airlied@linux.ie; linux-next@vger.kernel.org
> Subject: [PATCH v2 0/2] drm/radeon: use NULL instead of zero
> 
> This patches replace 0 with NULL when NULL pointers in radeon driver.
> The first in object functions.
> the second in clearstate headers.
> 
> Changes from v1:
> - splitted in two separated patches

For the series:

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

We'll pick these up for 3.16.

Alex

> 
> On Mon, May 05, 2014 at 12:53:58PM +0000, Deucher, Alexander wrote:
> > > -----Original Message-----
> > > From: Michele CURTI [mailto:michele.curti@gmail.com]
> > > Sent: Saturday, May 03, 2014 9:55 AM
> > > To: Deucher, Alexander; Koenig, Christian; airlied@linux.ie
> > > Cc: linux-next@vger.kernel.org
> > > Subject: [PATCH] drm/radeon: use NULL instead of zero
> > >
> > >
> > > Use NULL instead of zero for NULL pointers
> > >
> > > Signed-off-by: Michele Curti <michele.curti@gmail.com>
> >
> > Can you break this into two patches?  One that changes that clearstate
> headers and one that changes object functions?
> >
> > Thanks,
> >
> > Alex
> >
> 
> Sure!
> Or at least, I'm going to try..
> Michele
