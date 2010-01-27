From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: v4l-dvb tree build warning
Date: Wed, 27 Jan 2010 09:01:18 +0100
Message-ID: <4B5FF2CE.8070304@redhat.com>
References: <20100127121223.9af2253f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53922 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751254Ab0A0IDS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jan 2010 03:03:18 -0500
In-Reply-To: <20100127121223.9af2253f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Kilgore <kilgota@banach.math.auburn.edu>

Gi,

On 01/27/2010 02:12 AM, Stephen Rothwell wrote:
> Hi Mauro,
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>
> drivers/media/video/gspca/sq905c.c: In function 'sd_config':
> drivers/media/video/gspca/sq905c.c:207: warning: unused variable 'i'
>
> Introduced by commit 6436e86d8920520f6650bedaa816ed596c7c30b7 ("V4L/DVB
> (14006): gscpa_sq905c: Better detection of CIF resolution cameras").
>

Ack, my bad. Note that a fix for this is pending in Jean Francois' gscpa
tree, and AFAIK he has send a pull request.

Regards,

Hans
