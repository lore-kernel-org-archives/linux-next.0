Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BD35AC07;
	Thu, 13 Aug 2026 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642335; cv=none; b=ioP2+1UKhLzGhH5zHAZm5VmbiHBQCm7GJtNiEDF8WY92EdoXC82Mc9Gg0xXcjzXE/kyezEbeJKM1whc4gKYlWxtaUeVbggplLtNk96l3b/LQxfaA3fns0taw4VpLw/+vKXI92fZQ/yzq1yUmwWQY6y+iJ3Up+JyaGbmM4CpPGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642335; c=relaxed/simple;
	bh=3mZ815MrcLhu7FzOqiLhlDxwewTsblP3FXEEeUNPrY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVlj22okH4GN6MTQq66L/JYESHpZNISr/xLOQENOOy7Rn6CrbZvAvKNbWIfXdChylLxhydH3ljq6ZUnDI/eyXrk7FoC/V+BDmJl324J31rxps8+FDc1HMZlv8Z97JW7nIGuC4H/qeULvKoSBgzaM74hX25Sfeu6QJZriNwfpwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLdyNi04; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLdyNi04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786642334; x=1818178334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3mZ815MrcLhu7FzOqiLhlDxwewTsblP3FXEEeUNPrY0=;
  b=MLdyNi04QG3rw8uThrYguXufkzgr8zpLawH3f1Gg6H81q3v4RvPmBnm/
   Kl7JaYnEBe/Yvftbp+Y8PbbZREbOYy7PLU9w3SbHTJ60gIW/3gTs+PxKE
   pH6ntN/HBCRkaW55YZaXXPJXE/XyppzZUtKg0QDDS7lTRh++8/8PjrCd2
   OAx1DBrCpTeRsa0SONdRSUCuGVd0Uv0fSSjYHU1HGOputBHN8HDv4ipbO
   nZRcbZqU1Q3xlyCxr1hAY7rl5E2zmdlpG27Zxg9BB/Nejw9thTtBhVf/C
   a0ySAK70Gl/lxgSuiZc7ompPJicjyyPW+9Kw51ZBP8y2uydcu4mwJEHIf
   w==;
X-CSE-ConnectionGUID: 9aZrF5pwQOaObVkX39HpCA==
X-CSE-MsgGUID: 1t9RAqnvRG+JhvBRTcTp2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87247648"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87247648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 10:32:14 -0700
X-CSE-ConnectionGUID: QNdfj4BFQ8CTiW4UgHuncw==
X-CSE-MsgGUID: xw49tTBuQIy+K7e/JXbBTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264581948"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 10:32:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuZHl-00000000W2A-0S0q;
	Thu, 13 Aug 2026 17:32:09 +0000
Date: Fri, 14 Aug 2026 01:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Keith Busch <kbusch@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Fengnan Chang <changfengnan@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	Hannes Reinecke <hare@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <202608140117.H5jC1r7B-lkp@intel.com>
References: <anDHU9Wc-EGV1KYL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anDHU9Wc-EGV1KYL@sirena.org.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[cannot apply to linus/master v7.2-rc7 next-20260812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-block-tree/20260813-203616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/anDHU9Wc-EGV1KYL%40sirena.org.uk
patch subject: linux-next: build failure after merge of the block tree
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608140117.H5jC1r7B-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140117.H5jC1r7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140117.H5jC1r7B-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/iomap/direct-io.c: In function '__iomap_dio_read_simple':
>> fs/iomap/direct-io.c:1036:15: error: too many arguments to function 'bio_iov_iter_get_pages'; expected 3, have 4
    1036 |         ret = bio_iov_iter_get_pages(bio, iter, bdev_dma_alignment(bio->bi_bdev),
         |               ^~~~~~~~~~~~~~~~~~~~~~
    1037 |                                      alignment - 1);
         |                                      ~~~~~~~~~~~~~
   In file included from include/linux/bio-integrity.h:5,
                    from fs/iomap/direct-io.c:6:
   include/linux/bio.h:479:5: note: declared here
     479 | int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/bio_iov_iter_get_pages +1036 fs/iomap/direct-io.c

   990	
   991	ssize_t __iomap_dio_read_simple(struct kiocb *iocb, struct iov_iter *iter,
   992			struct iomap_iter *iomi)
   993	{
   994		gfp_t gfp = (iomi->flags & IOMAP_NOWAIT) ? GFP_NOWAIT : GFP_KERNEL;
   995		struct iomap_dio_simple *sr;
   996		unsigned int alignment;
   997		struct bio *bio;
   998		ssize_t ret;
   999	
  1000		if (iomi->iomap.type != IOMAP_MAPPED ||
  1001		    iomi->iomap.offset + iomi->iomap.length < iomi->pos + iomi->len ||
  1002		    (iomi->iomap.flags & IOMAP_F_INTEGRITY)) {
  1003			ret = -ENOTBLK;
  1004			goto out_dio_end;
  1005		}
  1006	
  1007		alignment = iomap_dio_alignment(iomi->inode, iomi->iomap.bdev, 0);
  1008		if ((iomi->pos | iomi->len) & (alignment - 1)) {
  1009			ret = -EINVAL;
  1010			goto out_dio_end;
  1011		}
  1012	
  1013		if (unlikely(!iomi->inode->i_sb->s_dio_done_wq &&
  1014				!is_sync_kiocb(iocb))) {
  1015			ret = sb_init_dio_done_wq(iomi->inode->i_sb);
  1016			if (ret < 0)
  1017				goto out_dio_end;
  1018		}
  1019	
  1020		trace_iomap_dio_rw_begin(iocb, iter, 0, 0);
  1021	
  1022		bio = bio_alloc_bioset(iomi->iomap.bdev,
  1023				       bio_iov_vecs_to_alloc(iter, BIO_MAX_VECS),
  1024				       REQ_OP_READ, gfp, &iomap_dio_simple_pool);
  1025		if (!bio) {
  1026			ret = -EAGAIN;
  1027			goto out_dio_end;
  1028		}
  1029		sr = container_of(bio, struct iomap_dio_simple, bio);
  1030		sr->iocb = iocb;
  1031		sr->dio_flags = 0;
  1032	
  1033		bio->bi_iter.bi_sector = iomap_sector(&iomi->iomap, iomi->pos);
  1034		bio->bi_ioprio = iocb->ki_ioprio;
  1035	
> 1036		ret = bio_iov_iter_get_pages(bio, iter, bdev_dma_alignment(bio->bi_bdev),
  1037					     alignment - 1);
  1038		if (unlikely(ret))
  1039			goto out_bio_put;
  1040	
  1041		if (bio->bi_iter.bi_size != iomi->len) {
  1042			iov_iter_revert(iter, bio->bi_iter.bi_size);
  1043			ret = -ENOTBLK;
  1044			goto out_bio_release_pages;
  1045		}
  1046	
  1047		sr->size = bio->bi_iter.bi_size;
  1048		if (user_backed_iter(iter)) {
  1049			bio_set_pages_dirty(bio);
  1050			sr->dio_flags |= IOMAP_DIO_USER_BACKED;
  1051		}
  1052	
  1053		if (iocb->ki_flags & IOCB_NOWAIT)
  1054			bio->bi_opf |= REQ_NOWAIT;
  1055	
  1056		if (is_sync_kiocb(iocb)) {
  1057			submit_bio_wait(bio);
  1058			return iomap_dio_simple_complete(sr);
  1059		}
  1060	
  1061		if ((iocb->ki_flags & IOCB_HIPRI)) {
  1062			bio->bi_opf |= REQ_POLLED;
  1063			WRITE_ONCE(iocb->private, bio);
  1064		}
  1065		bio->bi_end_io = iomap_dio_simple_end_io;
  1066		submit_bio(bio);
  1067		trace_iomap_dio_rw_queued(iomi->inode, iocb->ki_pos, iomi->len);
  1068		return -EIOCBQUEUED;
  1069	
  1070	out_bio_release_pages:
  1071		bio_release_pages(bio, false);
  1072	out_bio_put:
  1073		bio_put(bio);
  1074	out_dio_end:
  1075		inode_dio_end(iomi->inode);
  1076		return ret;
  1077	}
  1078	EXPORT_SYMBOL_GPL(__iomap_dio_read_simple);
  1079	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
