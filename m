From: "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Tue, 13 Sep 2016 09:09:53 -0500
Message-ID: <47697E90-DAB1-4940-834A-E7932044928C@linux.vnet.ibm.com>
References: <20160913141546.648845fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49565 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751433AbcIMOJ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Sep 2016 10:09:59 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8DE89eL144119
        for <linux-next@vger.kernel.org>; Tue, 13 Sep 2016 10:09:58 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
        by mx0b-001b2d01.pphosted.com with ESMTP id 25e3x1nwe5-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 13 Sep 2016 10:09:57 -0400
Received: from localhost
        by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <bryantly@linux.vnet.ibm.com>;
        Tue, 13 Sep 2016 08:09:57 -0600
In-Reply-To: <20160913141546.648845fb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Michael Cyr <mikecyr@linux.vnet.ibm.com>



On 9/12/16, 11:15 PM, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:

    > Hi James,
    > 
    > After merging the scsi tree, today's linux-next build (powerpc
    > allyesconfig) produced this warning:
    > 
    > drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c: In function 'ibmvscsis_rdma':
    > drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:3190:20: warning: unused variable 'srp' [-Wunused-variable]
    >     struct srp_cmd *srp = (struct srp_cmd *)iue->sbuf->buf;
    >                     ^
    > 
    > Introduced by commit
    > 
     >  812902159d41 ("scsi: ibmvscsis: Code cleanup of print statements")
    
Looks like cleaning up the print statement made this variable unused so deleting that line would be best. 

-Bryant     
    
