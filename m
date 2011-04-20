From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for April 20
Date: Wed, 20 Apr 2011 11:02:24 -0700
Message-ID: <20110420110224.e3974722.rdunlap@xenotime.net>
References: <20110420144329.fce0e28e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110420144329.fce0e28e.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 20 Apr 2011 14:43:29 +1000 Stephen Rothwell wrote:

> Hi all,

> Merging sound/for-next
> Merging sound-asoc/for-next

Takashi,

mainline contains commit a2800300f28bd1814f3ba8cfd93ecb0b00c2dfe3
Author: Takashi Iwai <tiwai@suse.de>
Date:   Tue Mar 8 18:20:46 2011 +0100
    ALSA: asihpi - Use %zd for size_t argument in error message

which changes:
--- a/sound/pci/asihpi/hpi6205.c
+++ b/sound/pci/asihpi/hpi6205.c
@@ -2088,7 +2088,7 @@ static u16 message_response_sequence(struct hpi_adapter_ob
j *pao,
 		phr->specific_error = sizeof(interface->u);
 		phr->size = sizeof(struct hpi_response_header);
 		HPI_DEBUG_LOG(ERROR,
-			"message len %d too big for buffer %ld \n", phm->size,
+			"message len %d too big for buffer %zd \n", phm->size,
 			sizeof(interface->u));
 		return 0;
 	}


However, it looks like there is a patch in your for-next branch which undoes
that commit, since hpi6205.c still uses %ld to print the sizeof() value and this
warning is still produced:

linux-next-20110420/sound/pci/asihpi/hpi6205.c:2091: warning: format '%ld' expects type 'long int', but argument 3 has type 'unsigned int'


Please drop at least that one line from for-next.

or am I completely befuddled?

thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
