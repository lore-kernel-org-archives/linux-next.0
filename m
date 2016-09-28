From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the vfs-miklos
 tree
Date: Wed, 28 Sep 2016 15:00:22 +1000
Message-ID: <20160928150022.7e87b6e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Prakash Surya <surya1@llnl.gov>, "John L. Hammond" <john.hammond@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/lustre/lustre/llite/file.c

between commit:

  302d50e7203e ("switch generic_file_splice_read() to use of ->read_iter()")

from the vfs-miklos tree and commits:

  5b8a39c53a16 ("staging: lustre: llite: Replace write mutex with range lock")
  ee5532436a7d ("staging: lustre: lov: remove LL_IOC_RECREATE_{FID, OBJ}")

from the staging tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/staging/lustre/lustre/llite/file.c
index d1d1efac1431,6e3a188baaae..000000000000
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@@ -1141,8 -1121,8 +1121,8 @@@ ll_file_io_generic(const struct lu_env 
  	struct cl_io	 *io;
  	ssize_t	       result;
  
- 	CDEBUG(D_VFSTRACE, "file: %pD, type: %d ppos: %llu, count: %zd\n",
 -	CDEBUG(D_VFSTRACE, "file: %s, type: %d ppos: %llu, count: %zu\n",
 -	       file->f_path.dentry->d_name.name, iot, *ppos, count);
++	CDEBUG(D_VFSTRACE, "file: %pD, type: %d ppos: %llu, count: %zu\n",
 +	       file, iot, *ppos, count);
  
  restart:
  	io = vvp_env_thread_io(env);
@@@ -1150,26 -1130,59 +1130,45 @@@
  
  	if (cl_io_rw_init(env, io, iot, *ppos, count) == 0) {
  		struct vvp_io *vio = vvp_env_io(env);
- 		int write_mutex_locked = 0;
+ 		bool range_locked = false;
+ 
+ 		if (file->f_flags & O_APPEND)
+ 			range_lock_init(&range, 0, LUSTRE_EOF);
+ 		else
+ 			range_lock_init(&range, *ppos, *ppos + count - 1);
  
  		vio->vui_fd  = LUSTRE_FPRIVATE(file);
 -		vio->vui_io_subtype = args->via_io_subtype;
 +		vio->vui_iter = args->u.normal.via_iter;
 +		vio->vui_iocb = args->u.normal.via_iocb;
- 		if ((iot == CIT_WRITE) &&
++		/*
++		 * Direct IO reads must also take range lock,
++		 * or multiple reads will try to work on the same pages
++		 * See LU-6227 for details.
++		 */
++		if (((iot == CIT_WRITE) ||
++		     (iot == CIT_READ && (file->f_flags & O_DIRECT))) &&
 +		    !(vio->vui_fd->fd_flags & LL_FILE_GROUP_LOCKED)) {
- 			if (mutex_lock_interruptible(&lli->lli_write_mutex)) {
- 				result = -ERESTARTSYS;
++			CDEBUG(D_VFSTRACE, "Range lock [%llu, %llu]\n",
++			       range.rl_node.in_extent.start,
++			       range.rl_node.in_extent.end);
++			result = range_lock(&lli->lli_write_tree,
++					    &range);
++			if (result < 0)
 +				goto out;
- 			}
- 			write_mutex_locked = 1;
+ 
 -		switch (vio->vui_io_subtype) {
 -		case IO_NORMAL:
 -			vio->vui_iter = args->u.normal.via_iter;
 -			vio->vui_iocb = args->u.normal.via_iocb;
 -			/*
 -			 * Direct IO reads must also take range lock,
 -			 * or multiple reads will try to work on the same pages
 -			 * See LU-6227 for details.
 -			 */
 -			if (((iot == CIT_WRITE) ||
 -			     (iot == CIT_READ && (file->f_flags & O_DIRECT))) &&
 -			    !(vio->vui_fd->fd_flags & LL_FILE_GROUP_LOCKED)) {
 -				CDEBUG(D_VFSTRACE, "Range lock [%llu, %llu]\n",
 -				       range.rl_node.in_extent.start,
 -				       range.rl_node.in_extent.end);
 -				result = range_lock(&lli->lli_write_tree,
 -						    &range);
 -				if (result < 0)
 -					goto out;
 -
 -				range_locked = true;
 -			}
 -			down_read(&lli->lli_trunc_sem);
 -			break;
 -		case IO_SPLICE:
 -			vio->u.splice.vui_pipe = args->u.splice.via_pipe;
 -			vio->u.splice.vui_flags = args->u.splice.via_flags;
 -			break;
 -		default:
 -			CERROR("Unknown IO type - %u\n", vio->vui_io_subtype);
 -			LBUG();
++			range_locked = true;
  		}
 +		down_read(&lli->lli_trunc_sem);
  		ll_cl_add(file, env, io);
  		result = cl_io_loop(env, io);
  		ll_cl_remove(file, env);
 -		if (args->via_io_subtype == IO_NORMAL)
 -			up_read(&lli->lli_trunc_sem);
 +		up_read(&lli->lli_trunc_sem);
- 		if (write_mutex_locked)
- 			mutex_unlock(&lli->lli_write_mutex);
+ 		if (range_locked) {
+ 			CDEBUG(D_VFSTRACE, "Range unlock [%llu, %llu]\n",
+ 			       range.rl_node.in_extent.start,
+ 			       range.rl_node.in_extent.end);
+ 			range_unlock(&lli->lli_write_tree, &range);
+ 		}
  	} else {
  		/* cl_io_rw_init() handled IO */
  		result = io->ci_result;
@@@ -1256,88 -1269,31 +1255,6 @@@ static ssize_t ll_file_write_iter(struc
  	return result;
  }
  
- static int ll_lov_recreate(struct inode *inode, struct ost_id *oi, u32 ost_idx)
- {
- 	struct obd_export *exp = ll_i2dtexp(inode);
- 	struct obd_trans_info oti = { 0 };
- 	struct obdo *oa = NULL;
- 	int lsm_size;
- 	int rc = 0;
- 	struct lov_stripe_md *lsm = NULL, *lsm2;
- 
- 	oa = kmem_cache_zalloc(obdo_cachep, GFP_NOFS);
- 	if (!oa)
- 		return -ENOMEM;
- 
- 	lsm = ccc_inode_lsm_get(inode);
- 	if (!lsm_has_objects(lsm)) {
- 		rc = -ENOENT;
- 		goto out;
- 	}
- 
- 	lsm_size = sizeof(*lsm) + (sizeof(struct lov_oinfo) *
- 		   (lsm->lsm_stripe_count));
- 
- 	lsm2 = libcfs_kvzalloc(lsm_size, GFP_NOFS);
- 	if (!lsm2) {
- 		rc = -ENOMEM;
- 		goto out;
- 	}
- 
- 	oa->o_oi = *oi;
- 	oa->o_nlink = ost_idx;
- 	oa->o_flags |= OBD_FL_RECREATE_OBJS;
- 	oa->o_valid = OBD_MD_FLID | OBD_MD_FLFLAGS | OBD_MD_FLGROUP;
- 	obdo_from_inode(oa, inode, OBD_MD_FLTYPE | OBD_MD_FLATIME |
- 				   OBD_MD_FLMTIME | OBD_MD_FLCTIME);
- 	obdo_set_parent_fid(oa, &ll_i2info(inode)->lli_fid);
- 	memcpy(lsm2, lsm, lsm_size);
- 	ll_inode_size_lock(inode);
- 	rc = obd_create(NULL, exp, oa, &lsm2, &oti);
- 	ll_inode_size_unlock(inode);
- 
- 	kvfree(lsm2);
- 	goto out;
- out:
- 	ccc_inode_lsm_put(inode, lsm);
- 	kmem_cache_free(obdo_cachep, oa);
- 	return rc;
- }
- 
- static int ll_lov_recreate_obj(struct inode *inode, unsigned long arg)
- {
- 	struct ll_recreate_obj ucreat;
- 	struct ost_id		oi;
- 
- 	if (!capable(CFS_CAP_SYS_ADMIN))
- 		return -EPERM;
- 
- 	if (copy_from_user(&ucreat, (struct ll_recreate_obj __user *)arg,
- 			   sizeof(ucreat)))
- 		return -EFAULT;
- 
- 	ostid_set_seq_mdt0(&oi);
- 	ostid_set_id(&oi, ucreat.lrc_id);
- 	return ll_lov_recreate(inode, &oi, ucreat.lrc_ost_idx);
- }
- 
- static int ll_lov_recreate_fid(struct inode *inode, unsigned long arg)
 -/*
 - * Send file content (through pagecache) somewhere with helper
 - */
 -static ssize_t ll_file_splice_read(struct file *in_file, loff_t *ppos,
 -				   struct pipe_inode_info *pipe, size_t count,
 -				   unsigned int flags)
--{
- 	struct lu_fid	fid;
- 	struct ost_id	oi;
- 	u32		ost_idx;
 -	struct lu_env      *env;
 -	struct vvp_io_args *args;
 -	ssize_t	     result;
 -	int		 refcheck;
--
- 	if (!capable(CFS_CAP_SYS_ADMIN))
- 		return -EPERM;
 -	env = cl_env_get(&refcheck);
 -	if (IS_ERR(env))
 -		return PTR_ERR(env);
--
- 	if (copy_from_user(&fid, (struct lu_fid __user *)arg, sizeof(fid)))
- 		return -EFAULT;
 -	args = ll_env_args(env, IO_SPLICE);
 -	args->u.splice.via_pipe = pipe;
 -	args->u.splice.via_flags = flags;
--
- 	fid_to_ostid(&fid, &oi);
- 	ost_idx = (fid_seq(&fid) >> 16) & 0xffff;
- 	return ll_lov_recreate(inode, &oi, ost_idx);
 -	result = ll_file_io_generic(env, args, in_file, CIT_READ, ppos, count);
 -	cl_env_put(env, &refcheck);
 -	return result;
--}
--
  int ll_lov_setstripe_ea_info(struct inode *inode, struct dentry *dentry,
  			     __u64 flags, struct lov_user_md *lum,
  			     int lum_size)
