From: Chad Dupuis <chad.dupuis@cavium.com>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Date: Thu, 23 Feb 2017 10:04:45 -0500 (EST)
Message-ID: <alpine.OSX.2.00.1702231002450.748@n5127mndc1pbs1.qlogic.org>
References: <20170223141240.0c15a9aa@canb.auug.org.au> <yq1ino16lbm.fsf@oracle.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yq1ino16lbm.fsf@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nilesh Javali <nilesh.javali@cavium.com>, Manish Rangankar <manish.rangankar@cavium.com>, Saurav Kashyap <saurav.kashyap@cavium.com>, Arun Easi <arun.easi@cavium.com>
List-Id: linux-next.vger.kernel.org



On Thu, 23 Feb 2017, 2:19pm -0000, Martin K. Petersen wrote:

> 
> *sigh*
> 
> Chad: Please fix these up ASAP.
> 
> 

Just submitted a patch to the list to fix this up.  I tested against the 
mainline which has the net-next merge and the kref refcount_t conversion 
to verify.
