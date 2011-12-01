From: KY Srinivasan <kys@microsoft.com>
Subject: RE: linux-next: manual merge of the staging tree with the hid tree
Date: Thu, 1 Dec 2011 10:12:33 +0000
Message-ID: <6E21E5352C11B742B20C142EB499E0481AA7B139@TK5EX14MBXC126.redmond.corp.microsoft.com>
References: <20111201143952.9aea929b16c7212570fc1bd2@canb.auug.org.au>
 <20111201035113.GA7647@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]:40010
	"EHLO AM1EHSOBE004.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752625Ab1LAKNs convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Dec 2011 05:13:48 -0500
In-Reply-To: <20111201035113.GA7647@kroah.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Meyer <thomas@m3y3r.de>, Jiri Kosina <jikos@jikos.cz>



> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Wednesday, November 30, 2011 10:51 PM
> To: Stephen Rothwell
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; KY Srinivasan;
> Thomas Meyer; Jiri Kosina
> Subject: Re: linux-next: manual merge of the staging tree with the hid tree
> 
> On Thu, Dec 01, 2011 at 02:39:52PM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> >
> > Today's linux-next merge of the staging tree got a conflict in
> > drivers/hid/hid-hyperv.c between commit b95f5bcb811e ("HID: Move the
> > hid-hyperv driver out of staging") from the hid tree and various commits
> > from the staging tree (this was drivers/staging/hv/hv_mouse.c).
> >
> > The commit message says that all the changes that happened when this file
> > moved from staging have also been applied to the staging file, so I just
> > used the version from the hid tree.
> 
> Ok, that's fine, Jiri, want me to just delete the driver from my tree
> now to remove any of these conflicts?

Jiri,

Yesterday (Nov 30th, 2011) I had sent a patch for the mouse driver to fix a bug
that got introduced during the recent cleanup to exit staging. This patch was against
the staging tree that Greg is planning to delete. It is a trivial patch; can you pick this up
for the hid tree. If you prefer, I could rebase the patch against your tree. Let me know.

Regards,

K. Y
