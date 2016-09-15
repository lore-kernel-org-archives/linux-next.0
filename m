From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Thu, 15 Sep 2016 09:55:39 -0400
Message-ID: <yq1fup1z2qs.fsf@sermon.lab.mkp.net>
References: <20160913141546.648845fb@canb.auug.org.au>
        <47697E90-DAB1-4940-834A-E7932044928C@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <47697E90-DAB1-4940-834A-E7932044928C@linux.vnet.ibm.com> (Bryant
        G. Ly's message of "Tue, 13 Sep 2016 09:09:53 -0500")
Sender: linux-kernel-owner@vger.kernel.org
To: "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Cyr <mikecyr@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

>>>>> "Bryant" == Bryant G Ly <bryantly@linux.vnet.ibm.com> writes:

Bryant> On 9/12/16, 11:15 PM, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:

>> Hi James,
>> 
>> After merging the scsi tree, today's linux-next build (powerpc
>> allyesconfig) produced this warning:
>> 
>> drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c: In function
>> 'ibmvscsis_rdma': drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:3190:20:
>> warning: unused variable 'srp' [-Wunused-variable] struct srp_cmd
>> *srp = (struct srp_cmd *)iue->sbuf->buf; ^
>> 
>> Introduced by commit
>> 
>> 812902159d41 ("scsi: ibmvscsis: Code cleanup of print statements")
    
Bryant> Looks like cleaning up the print statement made this variable
Bryant> unused so deleting that line would be best.

Please submit a patch to do so.

-- 
Martin K. Petersen	Oracle Linux Engineering
